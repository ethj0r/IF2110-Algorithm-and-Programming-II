#include <stdio.h>
#include "mesinkar.h"

char cc;
boolean eop;

static FILE *pita;
static int retval;

void start(){
    pita = fopen("pitakar.txt", "r");
    adv();
}

void adv(){
    retval = fscanf(pita, "%c", &cc);
    eop = (cc == MARK);
    if (eop) fclose(pita);
}