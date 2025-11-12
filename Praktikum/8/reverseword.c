#include <stdio.h>
#include "mesinkata.h"
#include "mesinkarakter.h"

int main() {
    STARTWORD();
    while (!EndWord) {
        for (int i=currentWord.Length-1; i>=0; i--) {
            printf("%c", currentWord.TabWord[i]);
        }
        printf("\n");
        ADVWORD();
    }
    return 0;
}