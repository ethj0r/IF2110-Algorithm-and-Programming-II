#include <stdio.h>
#include "mesinkata1.h"

int main() {
    startKata();
    while (!endKata) {
        for (int i = 0; i < currentKata.length; i++) {
            printf("%c", currentKata.buffer[i]);
        }
        printf("\n");
        advKata();
    }
    return 0;
}