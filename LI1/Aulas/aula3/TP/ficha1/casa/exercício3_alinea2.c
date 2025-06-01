#include <stdio.h>

int dimensao () {
    int d;

    printf ("Insere a dimensão da figura: ");
    scanf ("%d",&d);

    return d;
}

void desenhaLinhaPar (int n) {
    int i;
    
    for (i = 0; i < n; i++) {
        if (i % 2 == 0) putchar ('#');
        else putchar ('_');
    }
    putchar ('\n');
}

void desenhaLinhaImpar (int n) {
    int i;
    
    for (i = 0; i < n; i++) {
        if (i % 2 == 0) putchar ('_');
        else putchar ('#');
    }
    putchar ('\n');
}

void desenha (int n) {
    int i; 

    for (i = 0; i < n; i++) {
        if (i % 2 == 0) desenhaLinhaPar (n);
        else desenhaLinhaImpar (n);
    }
}

int main () {
    int n; 
    n = dimensao ();
    
    desenha (n);
    return 0;
}

