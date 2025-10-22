#include "listlinier.h"
#include <stdio.h>
#include <stdlib.h>

/**
 * Fungsi yang melakukan pengurutan dengan urutan menaik jika asc = true
 * dan menurun jika asc = false
 * 
 * I.S. List l terdefinisi dan berisi setidaknya 1 elemen
 * F.S. List l terurut secara urutan tertentu
 * 
 * Contoh: 
 * - Untuk l = [1, 5, 2, 3, 3], maka setelah sort(&l, true), l menjadi [1, 2, 3, 3, 5]
 */

void sort(List *l, boolean asc) {
    /* KAMUS LOKAL */
    Address curr;
    int n, i;
    ElType temp;
    
    /* ALGORITMA */
    if (*l == NULL || NEXT(*l) == NULL) {
        return;
    }

    curr = *l;
    while (curr != NULL) {
        Address minmax=curr;
        Address check= NEXT(curr);
        
        while (check!=NULL) {
            if ((asc && INFO(check) < INFO(minmax)) || 
                (!asc && INFO(check) > INFO(minmax))) {
                minmax = check;
            }
            check = NEXT(check);
        }
        
        if (minmax != curr) {
            temp = INFO(curr);
            INFO(curr) = INFO(minmax);
            INFO(minmax) = temp;
        }
        curr = NEXT(curr);
    }
}