#include <stdio.h> 

int leInteiro () {
    int n;

    printf ("Insere um número inteiro: ");
    scanf ("%d",&n);

    return n;
}

void escreve (int n) {
    
    for (int i = 1; i <= n; i++) {
        printf ("%d\n",i);
    }

}

int main () {
    escreve (leInteiro ());
    return 0;
}