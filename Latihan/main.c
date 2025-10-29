#include <stdio.h>


#define CAPACITY 100

typedef struct {
    int contents[CAPACITY];
    int nEff;
} List;

void printList(List l, int startIdx) {
    if (startIdx >= l.nEff) {
        return; // dah lewat idx terakhir
    } else {
        printf("%d ", l.contents[startIdx]);
        printList(l, startIdx+1);
    }
}

/**
 * _____________________________________________________________________
 */

void factorialP1(int n, int *result) {
    int temp;
    if (n==0) {
        *result = 1;
    } else {
        factorialP1(n-1, &temp);
        *result = n * temp;
    }
}

void factorialP2(int n, int *tmpRes) {
    if (n==0) {

    } else {
        factorialP2(n-1, tmpRes);
        *tmpRes = n * (*tmpRes);
    }
}

/**
 * _____________________________________________________________________
 */

int main() {

    // int n = 5;

    // int res;

    // int tmpRes = 1;

    // factorialP1(n, &res);
    // factorialP2(n, &tmpRes);

    // printf("%d! P1= %d\n", n, res);
    // printf("%d! P2= %d\n", n, tmpRes);

    List l;
    l.nEff = 5;
    l.contents[0] = 10;
    l.contents[1] = 20;
    l.contents[2] = 30;
    l.contents[3] = 40;
    l.contents[4] = 50;

    printf("Isi list: ");
    printList(l, 0); // start dari idx 0
    printf("\n");

    return 0;
}