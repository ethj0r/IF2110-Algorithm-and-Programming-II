#include <stdio.h>

#define MAX_N 10

int arr[MAX_N];
int subset[MAX_N];
int n;

void printSubset(int size){
    printf("[");
    for (int i=0; i<size; i++){
        if (i > 0) printf(",");
        printf("%d", subset[i]);
    }
    printf("]\n");
}

void generateSubsetsOfSize(int start, int targetSize, int currentSize){
    if (currentSize==targetSize){
        printSubset(currentSize);
        return;
    }

    for (int i=start; i<n-(targetSize-currentSize)+1; i++){
        subset[currentSize] = arr[i];
        generateSubsetsOfSize(i+1, targetSize, currentSize+1);
    }
}

int main(){
    scanf("%d", &n);
    for (int i=0; i<n; i++){
        scanf("%d", &arr[i]);
    }
    for (int size=0; size<=n; size++){
        generateSubsetsOfSize(0, size, 0);
    }

    return 0;
}