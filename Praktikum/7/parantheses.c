#include <stdio.h>

long long parentheses(int n) {
    if (n == 0) {
        return 0;
    }
    if (n == 1) {
        return 1;
    }
    
    long long res = 0;
    for (int i = 1; i <= n; i++) {
        long long left = parentheses(i - 1);
        long long right = parentheses(n - i);
        
        if (i == 1) {
            left = 1;
        }
        if (n - i == 0) {
            right = 1;
        }
        
        res += left * right;
    }
    return res;
}

int main() {
    int n;
    scanf("%d", &n);
    
    long long res = parentheses(n);
    printf("%lld\n", res);
    
    return 0;
}