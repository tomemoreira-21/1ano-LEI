#include <stdio.h> 

// 1
float multInt1 (int n,float m) {
    float r = 0;
    int c = 0;

    for (int i = 1; i <= n; i++) {
        c ++;
        r += m;
    }
    return r;
}

// 2
float multInt2 (int n,float m) {
    float r = 0;

    for (int i = n; i >= 1; i /= 2,m*=2) {
        if (i % 2 != 0) r += m;
    }

    return r;
}

// 3 
int mdc1 (int a,int b) {
    int menor,maior,divAtual = 0,c = 0;

    if (a < b) {
        menor = a; 
        maior = b;
    } else {
        menor = b;
        maior = a;
    }

    for (int i = 1; i <= menor; i++) {
        c ++;
        if (menor % i == 0 && maior % i == 0) {
            divAtual = i; 
        } 
    }

    return divAtual;
}

// 4 
int mdc2 (int a,int b) {
    int c = 0;

    while (a != 0) {
        c ++;
        if (a > b) a-=b;
        if (a < b) b -= a;
        if (a == b) return a; 
    }
    return b;
}

// 5
int mdc3 (int a,int b) {
    int temp;

    while (b != 0) {
        temp = a;
        a = b; 
        b = temp % b;    
    }

    return a;
}

// 6
// a 
int fib1 (int n) {
    if (n < 2) return 1; 
    else return (fib1 (n-1) + fib1 (n-2)); 
}

// b 
int fib2 (int n) {
    int n1 = 1,n2 = 1,temp;

    if (n < 2) return 1; 

    for (int i = 2; i < n; i++) {
        temp = n1;
        n1 = n2;
        n2 = temp + n2;
    }

    return n1 + n2;

}

