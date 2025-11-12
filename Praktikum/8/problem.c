/* File: problem.c */
/* Implementasi fungsi untuk mengecek apakah kalimat sesuai grammar dengan daftar objek */

/* Grammar yang digunakan:
 * <Kalimat> ::= <Subjek> <Predikat> <Objek> {, <Objek>}*
 *
 * Contoh kalimat valid:
 * - "aku beli buku."
 * - "aku beli buku, pensil, penggaris."
 * - "dia ambil tas, buku."
 *
 * Contoh tidak valid:
 * - "aku beli."
 * - "beli buku."
 * - "aku beli , pensil."
 */

#include "mesinkata.h"
#include "boolean.h"
#include <stdio.h>
#include <string.h>

/* ====== FSM Parser ====== */
typedef enum {
    S_EXPECT_SUBJECT = 0,
    S_EXPECT_PREDICATE,
    S_EXPECT_FIRST_OBJECT,
    S_EXPECT_SEPARATOR_OR_END,
    S_EXPECT_OBJECT_AFTER_COMMA 
} State;

/* ====== Helper ====== */
/* Membandingkan dua kata secara case-insensitive */
int eqWordCStrInsensitive(Word w, const char *s) {
    int n = (int)strlen(s);
    if (w.Length != n) return 0;
    for (int i = 0; i < n; i++) {
        char cw = w.TabWord[i];
        if ('A' <= cw && cw <= 'Z') cw = (char)(cw - 'A' + 'a');
        char cs = s[i];
        if ('A' <= cs && cs <= 'Z') cs = (char)(cs - 'A' + 'a');
        if (cw != cs) return 0;
    }
    return 1;
}

int isSubjek(const Word w) {
    return eqWordCStrInsensitive(w, "aku")
        || eqWordCStrInsensitive(w, "kamu")
        || eqWordCStrInsensitive(w, "dia");
}

int isPredikat(const Word w) {
    return eqWordCStrInsensitive(w, "beli")
        || eqWordCStrInsensitive(w, "ambil");
}

int isCommaToken(Word w) {
    return (w.Length == 1 && w.TabWord[0] == ',');
}

int isObjToken(Word w, int *hasTrailingComma) {
    if (w.Length == 0 || isCommaToken(w)) {
        *hasTrailingComma = 0;
        return 0;
    }
    
    if (w.TabWord[w.Length - 1] == ',') {
        *hasTrailingComma = 1;
        return (w.Length > 1);
    } else {
        *hasTrailingComma = 0;
        return 1;
    }
}

/*
* Fungsi utama untuk mengecek apakah kalimat sesuai grammar daftar objek
* I.S. Mesin kata sudah siap digunakan (panggil STARTWORD() sebelumnya)
* F.S. Mengembalikan true (1) jika kalimat valid, false (0) jika tidak
*
* Grammar: <Kalimat> ::= <Subjek> <Predikat> <Objek> {, <Objek>}*
*/
int cfg_parser() {
    State state = S_EXPECT_SUBJECT;
    int objectCount = 0; 
    int hasTrailingComma = 0;
    
    STARTWORD();
    
    while (!EndWord) {
        switch (state) {
            case S_EXPECT_SUBJECT:
                if (!isSubjek(currentWord)) return 0; 
                state = S_EXPECT_PREDICATE;
                ADVWORD();
                break;
                
            case S_EXPECT_PREDICATE:
                if (!isPredikat(currentWord)) return 0; 
                state = S_EXPECT_FIRST_OBJECT;
                ADVWORD();
                break;
                
            case S_EXPECT_FIRST_OBJECT:
                if (isCommaToken(currentWord)) return 0;
                if (!isObjToken(currentWord, &hasTrailingComma)) return 0; 
                objectCount++;
                
                if (hasTrailingComma) state = S_EXPECT_OBJECT_AFTER_COMMA;
                else state = S_EXPECT_SEPARATOR_OR_END;

                ADVWORD();
                break;
                
            case S_EXPECT_SEPARATOR_OR_END:
                if (isCommaToken(currentWord)) {
                    state = S_EXPECT_OBJECT_AFTER_COMMA;
                    ADVWORD();
                } else return 0;
                break;
                
            case S_EXPECT_OBJECT_AFTER_COMMA:
                if (isCommaToken(currentWord)) return 0; 
                if (!isObjToken(currentWord, &hasTrailingComma)) return 0; 
                objectCount++;
                
                if (hasTrailingComma) state = S_EXPECT_OBJECT_AFTER_COMMA;
                else state = S_EXPECT_SEPARATOR_OR_END;

                ADVWORD();
                break;
        }
    }
    return (state == S_EXPECT_SEPARATOR_OR_END && objectCount > 0);
}

// int main() {
//     printf("Enter kalimat: ");
//     int result = cfg_parser();
//     if (result)
//         printf("1\n");
//     else
//         printf("0\n");
//     return 0;
// }