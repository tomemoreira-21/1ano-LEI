#include <stdio.h> 

int dimensao () {
    int n; 

    printf ("Digite a dimensão: ");
    scanf ("%d",&n);

    return n;
}

void desenhaLinha (int espacos,int n) {
    int i; 

    for (i = 0; i < espacos;i++) {
        putchar (' ');
    }

    for (i = 0; i < n; i++) {
        putchar ('#');
    }
    putchar ('\n');
}

void triangulo (int n) {
    int i,espacos = 0,c = 1; 

    for (i = 0; i < n; i++) {
        espacos = n - i - 1;
        desenhaLinha (espacos,c);
        c += 2;
    }
}
