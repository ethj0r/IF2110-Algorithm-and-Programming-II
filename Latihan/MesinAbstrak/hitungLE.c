#include <stdio.h>
#include "mesinkar.h"

/* Program HitungLE
{ Menghitung banyaknya pasangan huruf 'L' dan 'E' yang bersebelahan 
  pada pita karakter }

KAMUS
    { *** Mesin yang dipakai *** }
    USE MESINKAR
    
    countLE: integer        { banyaknya pasangan LE }
    prevChar: character     { karakter sebelumnya }

ALGORITMA
    { Inisialisasi }
    countLE ← 0
    start
    
    { Simpan karakter pertama }
    prevChar ← cc
    adv
    
    { Proses pasangan karakter }
    while (cc ≠ MARK) do
        { Cek apakah prevChar = 'L' dan cc = 'E' }
        if (prevChar = 'L') and (cc = 'E') then
            countLE ← countLE + 1
        
        { Update prevChar untuk iterasi berikutnya }
        prevChar ← cc
        adv
    
    { cc = MARK: akhir pita }
    output(countLE) */

int main(){
    int countLE;
    char prevChar;

    countLE = 0;
    start();

    if (eop) {
        printf("%d\n", countLE);
        return 0;
    }

    prevChar = cc;
    adv();

    while (!eop) {
        if ((prevChar == 'L') && (cc == 'E')) {
            countLE++;
        }

        prevChar = cc;
        adv();
    }

    printf("%d\n", countLE);
    return 0;
}