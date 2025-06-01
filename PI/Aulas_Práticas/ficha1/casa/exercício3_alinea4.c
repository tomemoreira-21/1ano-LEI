#include <stdio.h>
#include <math.h>

int raio () {
    int r;

    printf ("Digite o raio do círculo pretendido: ");
    scanf ("%d",&r);

    return r;
}

void desenhaLinha (int espacos,int c) {
    int i; 

    for (i = 0; i < espacos; i++) {
        putchar (' ');
    }

    for (i = 0; i < c; i++) {
        putchar ('#');
    }
    putchar ('\n');
} 


/*
Valor de c
1ºParte 
x^2 + i^2 = r^2 -- equação do circulo
x = +- sqrt (r^2 - i^2) 

2ºParte
Comprimento da linha = (Maior x) − (Menor x) + 1
Comprimento da linha = (sqrt (r^2 - i^2) - (- sqrt (r^2 - i^2))) + 1
Comprimento da linha = 2*sqrt (r^2 - i^2) + 1
*/

void desenha (int r) {
    int i, espaços = r,c = 1,diametro; 
    diametro = r * 2 + 1;

    for (i = -r; i <= r; i++) {
        c = 2* (int)sqrt (r*r - i*i) + 1;
        espaços = r - c/2;
        desenhaLinha (espaços,c);
    }
}

int main () {
    int r; 
    r = raio ();

    desenha (r);
    return 0;
}