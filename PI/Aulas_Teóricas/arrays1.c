#include <stdio.h>

// 6 -> encontrar um elemento num array devolvendo o seu indice
int procura (int x, int v[],int n) {

    for (int i = 0; i < n; i++) {
        if (v[i] == x) return i;
    }
    return -1;
} 


// 7 -> para arrays ordenados 
int procuraOrd (int x, int v [],int n) {
    
    for (int i = 0; i < n && v[i] <= x; i++) { 
        if (v[i] == x) return i;
    }
    return -1;
 }

