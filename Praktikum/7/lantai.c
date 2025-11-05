#include <stdio.h>

int lantai(int N) {
    if (N == 1) {
        return 1;
    } else if (N == 2) {
        return 2;
    } else {
        return lantai(N-1) + lantai(N-2);
    }
}

int main() {
    int n;
    scanf("%d", &n);
    int res = lantai(n);
    printf("%d\n", res);
}