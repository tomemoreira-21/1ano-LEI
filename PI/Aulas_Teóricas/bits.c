#include <stdio.h>

/*
O operador << desloca os bits de um número para a esquerda e preenche os espaços vazios com zeros à direita. 
Isso é equivalente a multiplicar o número por 2^n, onde n é o número de posições deslocadas.
logo 
n = n << 1, é igual, a multiplicar por 2
*/

/*
O operador >> desloca os bits de um número para a direita e preenche os espaços vazios com zeros à esquerda. 
Isso é equivalente a dividir o número por 2^n, onde n é o número de posições deslocadas. 
logo 
n = n >> 1, é igual, a dividir por 2
*/

int main () { 
    int y = 5 << 1; // y = 10 <=> y = x*2
    int z = 3 << 2; // z = 3* (2^2) <=> z = 3*4 

    int w = 4 >> 1; // w = 4 / 2 <=> w = 2
    int h = 15 >> 2; // h = 15 / 4 <=> h = 3 

    printf ("5 << 1 = %d\n",y);
    printf ("3 << 2 = %d\n",z);

    printf ("4 >> 1 = %d\n",w);
    printf ("15 >> 2 = %d\n",h);
    
    return 0;
}
