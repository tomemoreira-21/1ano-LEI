#include <stdio.h> 

int dimensao () {
    int n; 

    printf ("Digita dimensão: ");
    scanf ("%d",&n);

    return n;
}

void desenharChar (int n) {
    int i; 

    for (i = 0; i < n; i++) {
        putchar ('#');
    }
    putchar ('\n');
}

void triangulo (int n) {
    int i;

    for (i = 1; i < n; i++) {
        desenharChar (i);
    }  

    for (i = n; i > 0; i--) {
        desenharChar (i);
    }

}
