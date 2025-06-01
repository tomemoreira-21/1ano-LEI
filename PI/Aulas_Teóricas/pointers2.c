#include <stdio.h>

void addTo (int *b,int a) {
    *b = *b + a;
}

int main () {
    int x = 2, y = 7;
    int *a;

    a = &x; 
    addTo (a,5); 
    addTo (&y,y); 
    x += y;  
    addTo (a,x); 
    printf ("%d",x); 

    return 0;
}