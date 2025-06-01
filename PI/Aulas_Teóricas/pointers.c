#include <stdio.h> 

int leInteiro () {
    int n; 

    printf ("Insere um número inteiro: ");
    scanf ("%d",&n);

    return n;
}

int escreve (int *x) {
    printf ("%d\n",*x);
    (*x) ++;
}

int main () {
    int n,i = 1;
    n = leInteiro ();

    while (i <= n) escreve (&i);

    return 0;
}