#include <stdio.h>

int leInteiro () {
    int n;

    printf ("Insere um número inteiro: ");
    scanf ("%d",&n);

    return n;
}


int fibonacci (int n) {
    int t[n+1];

    t[0] = 0;
    t[1] = 1;

    for (int i = 2; i <= n; i++) {
        t[i] = t[i-1] + t[i-2];
    }

    return t[n];
}

int main () {
    int n; 
    n = leInteiro ();
    
    printf ("fib (%d) = %d \n",n,fibonacci (n));

    return 0;
}