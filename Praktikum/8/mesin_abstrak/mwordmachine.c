#include <stdio.h>
#include "boolean.h"
#include "mesinkarakter.h"
#include "mesinkata.h"

void printWord(Word w) {
    int i;
    for (i = 0; i < w.Length; i++) {
        printf("%c", w.TabWord[i]);
    }
}

int main() {
    STARTWORD();
    
    while (!EndWord) {
        printWord(currentWord);
        printf("\n");
        ADVWORD();
    }
    
    return 0;
}