/* File: problem.c */
/* Implementasi fungsi untuk membalik linked list */
#include "listlinier.h"
#include <stdio.h>
#include <stdlib.h>

/*
 * Fungsi untuk membalik linked list secara in-place
 * I.S. l terdefinisi, mungkin kosong
 * F.S. Elemen-elemen dalam list l dibalik urutannya
 *
 * Contoh:
 * Jika l adalah [1,2,3,4,5], maka setelah reverseList(&l), l menjadi [5,4,3,2,1]
 * Jika l adalah [], maka setelah reverseList(&l), l tetap []
 * Jika l adalah [1], maka setelah reverseList(&l), l tetap [1]
 *
 * Hint: Gunakan 3 pointer (prev, current, next) untuk membalik arah pointer
 * Jangan lupa update FIRST(l) di akhir!
 */
void reverseList(List *l) {
    /* KAMUS LOKAL */
    Address prev, curr, next;
    
    /* ALGORITMA */
    if (*l == NULL || NEXT(*l) == NULL) {
        return;
    }
    
    prev = NULL;
    curr = *l;
    
    while (curr != NULL) {
        next = NEXT(curr);
        NEXT(curr) = prev;
        prev = curr;
        curr = next;
    }
    
    *l = prev;
}

/*
 * Fungsi untuk menyusun ulang elemen-elemen linked list sehingga
 * semua elemen pada posisi ganjil (1, 3, 5, ...) muncul lebih dulu,
 * diikuti oleh elemen pada posisi genap (2, 4, 6, ...).
 * Urutan relatif antar elemen ganjil maupun antar elemen genap
 * harus tetap dipertahankan.
 *
 * I.S. : l terdefinisi, mungkin kosong
 * F.S. : Elemen-elemen dalam list l diubah urutannya secara in-place
 * tanpa alokasi/dealokasi node baru.
 *
 * Contoh:
 * Jika l adalah [1,2,3,4,5], maka setelah oddEvenLinkedList(&l), l menjadi [1,3,5,2,4]
 * Jika l adalah [10,20,30,40,50,60], maka hasilnya [10,30,50,20,40,60]
 * Jika l adalah [7], maka tetap [7]
 * Jika l adalah [], maka tetap []
*/
void oddEvenLinkedList(List *l) {
    /* KAMUS LOKAL */
    Address odd, even, evenHead;
    
    /* ALGORITMA */
    if (*l == NULL || NEXT(*l) == NULL) {
        return;
    }
    
    odd = *l;
    even = NEXT(*l);
    evenHead = even;
    
    while (even != NULL && NEXT(even) != NULL) {
        NEXT(odd) = NEXT(even);
        odd = NEXT(odd);
        
        NEXT(even) = NEXT(odd);
        even = NEXT(even);
    }
    
    NEXT(odd) = evenHead;
}