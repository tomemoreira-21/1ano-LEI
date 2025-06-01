#include <stdio.h> 

int leInteiro () {
    int n;

    printf ("Insere um número: ");
    scanf ("%d",&n);

    return n;
}

int fat (int n) {
    int r = 1;

    while (n != 0) r *= (n--);

    return r;
}

int main () {
    int n; 
    n = leInteiro ();
    
    printf ("%d! = %d \n",n,fat(n));

    return 0;
}
