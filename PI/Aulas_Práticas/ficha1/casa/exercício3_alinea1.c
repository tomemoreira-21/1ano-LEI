#include <stdio.h>

int dimensao () {
    int d;

    printf ("Insere a dimensão da figura: ");
    scanf ("%d",&d);

    return d;
}

void desenhaLinha (int n) {
    int i; 

    for (i = 0; i < n; i++) {
        putchar ('#');
    }
    putchar ('\n');
}

void desenha (int n) {
    int i; 

    for (i = 0; i < n; i++) desenhaLinha (n);

}

int main () {
    int i,d; 
    d = dimensao ();

    desenha (d);
    return 0;
}