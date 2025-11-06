#ifndef MESINKATA1_H
#define MESINKATA1_H

#include "mesinkar.h"

#define N_MAX 50
#define BLANK ' '

typedef struct {
    char buffer[N_MAX];
    int length;
} Kata;

/* State Mesin Kata */
extern boolean endKata;
extern Kata currentKata;

void ignoreBlank();
/* Mengabaikan satu atau beberapa BLANK
    I.S.: cc sembarang
    F.S.: cc ≠ BLANK atau cc = MARK */

void startKata();
/* I.S.: cc sembarang
    F.S.: endKata = true, dan cc = MARK;
        atau endKata = false,
        currentKata adalah kata yang sudah diakuisisi,
        cc karakter pertama sesudah karakter terakhir kata */

void advKata();
/* I.S.: cc adalah karakter pertama kata yang akan diakuisisi
    F.S.: currentKata adalah kata terakhir yang sudah diakuisisi,
        cc adalah karakter pertama dari kata berikutnya, mungkin MARK
        Proses: Akuisisi kata menggunakan procedure salinKata */

void salinKata();
/* Mengakuisisi kata, menyimpan dalam currentKata
    I.S.: cc adalah karakter pertama dari kata
    F.S.: currentKata berisi kata yang sudah diakuisisi;
        cc = BLANK atau cc = MARK;
        cc adalah karakter sesudah karakter terakhir yang diakuisisi */

#endif