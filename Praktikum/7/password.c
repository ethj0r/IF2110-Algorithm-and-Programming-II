#include "password.h"
#include <stdlib.h>

/**
 * Fungsi untuk mendapatkan panjang angka
 *
 * Hint: gunakan log10
 *
 * kembalikan -1 jika angka == 0
 */
int length(int angka) {
    if (angka == 0) {
        return -1;
    }
    int len = (int)log10(abs(angka)) + 1;
    return len;
}

/**
 * Fungsi untuk mendapatkan digit ke-i dari kanan
 *
 * Contoh:
 * angka = 1234
 *
 * index = 2
 * return -> 2
 *
 * index = 1
 * return -> 3
 *
 * index = 0
 * return -> 4
 *
 * index = 4
 * return -> -1
 *
 * Hint: Gunakan operasi matematika power, module, dan div
 *
 * kembalikan -1 jika index > panjang atau index < 0
 */
int getDigit(int angka, int index){
    int len = length(angka);
    if (len == -1) return -1;
    if (index < 0 || index >= len) {
        return -1;
    }
    
    angka = abs(angka);
    
    int divisor = (int)pow(10, index);
    int digit = (angka / divisor) % 10;
    return digit;
}

/**
 * Fungsi untuk menghapus digit ke-i dari kanan (misal: hapus index ke 2 dari 1234 -> 124)
 *
 *
 * Hint: Gunakan operasi matematika power, module, dan div untuk mendapatkan angka sebelah kiri dan kanan index lalu gabungkan dengan menggunakan perkalian power of 10 dan penjumlahan
 *
 * kembalikan angka yang sama jika index > panjang atau index < 0
 */
int removeDigit(int angka, int index){
    int len = length(angka);
    if (len == -1) return angka;
    if (index < 0 || index >= len) {
        return angka;
    }
    
    angka = abs(angka);
    
    int divisorRight = (int)pow(10, index + 1);
    int leftPart = angka / divisorRight;
    
    int divisorLeft = (int)pow(10, index);
    int rightPart = angka % divisorLeft;
    
    int result = leftPart * divisorLeft + rightPart;
    return result;
}

/**
 * Fungsi rekursif untuk mencari semua kombinasi angka
 * 
 * Hint:
 * - gunakan loop untuk melakukan iterasi ke seluruh digit di angka
 * - gunakan digit yang dipilih (dalam loop diatas) sebagai new current
 *   - current = 1, digit = 2 -> new current = 12
 * - hilangkan digit yang dipilih (dalam loop diatas) sebagai new angka
 *   - angka = 1234, digit yang dipilih = 2 -> new angka = 134
 * - panggil kembali fungsi rekursif
 */
void cariKombinasi(int angka, int current, int panjangAwal){
    if (length(angka) == -1) {
        printf("%d\n", current);
        return;
    }
    
    int len = length(angka);
    
    for (int i = 0; i < len; i++) {
        int digit = getDigit(angka, i);
        
        int newCurrent;
        if (current == 0) {
            newCurrent = digit;
        } else {
            newCurrent = current * 10 + digit;
        }
        
        int newAngka = removeDigit(angka, i);
        
        cariKombinasi(newAngka, newCurrent, panjangAwal);
    }
}

/**
 * Fungsi untuk menginisialisasi pemanggilan cariKombinasi
 */
void findPassword(int angka){
    if (angka == 0) {
        printf("0\n");
        return;
    }
    
    int len = length(angka);
    if (len == -1) {
        return;
    }
    
    cariKombinasi(angka, 0, len);
}


// int main() {
//     printf("Test 1 (input: 12):\n");
//     findPassword(12);
    
//     printf("\nTest 2 (input: 123):\n");
//     findPassword(123);
    
//     printf("\nTest 3 (input: 1):\n");
//     findPassword(1);
    
//     printf("\nTest 4 (input: 0):\n");
//     findPassword(0);
    
//     return 0;
// }