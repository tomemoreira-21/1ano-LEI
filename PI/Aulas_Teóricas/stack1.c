#include <stdio.h>
#define MAX 100

typedef struct {
    int valores [MAX];
    int tam;
} stack;


// Função que verifica se a stack está vazia
int isEmpty (stack *s) {
    return (s -> tam == 0); // (*s).tam == s -> tam
}

// Função que insere um valor na stack 
int push (stack *s,int n) {
    if (s->tam < MAX) {
        s -> valores [s->tam++] = n; 
        return 0;
    } 

    return -1;
}

// Função que remove o valor da stack 
int pull (stack *s,int n) {
    int pos = -1; 

    for (int j = 0; j < s->tam; j++) {
        if (s->valores [j] == n) {
            pos = j;
            s -> tam --;
            for (int i = pos; i < s->tam; i++) {
                s->valores[i] = s->valores[i+1];
            }
        }
    }

    if (pos == -1) {
        printf ("O valor %d não pertence à stack!\n",n);
        return -1;
    }

    return 0;
}

int main () {
    stack s = {{3,8,7,4,5},5};

    printf ("Stack Inicial:\n");
    for (int i = 0; i < s.tam; i++) {
        printf ("%d ",s.valores[i]);
    }
    printf ("\nTamanho: %d\n\n",s.tam);

    if (push (&s,10) == 0) {
        printf ("Stack com o 10 adicionado: \n");
        for (int i = 0; i < s.tam; i++) {
            printf ("%d ",s.valores[i]);
        }
        printf ("\nTamanho: %d\n\n",s.tam);
    }

    if (pull (&s,19) == 0) {
        printf ("Stack retirando o número 8: \n");
        for (int i = 0; i < s.tam; i++) {
            printf ("%d ",s.valores[i]);
        }
        printf ("\nTamanho: %d\n\n",s.tam);
    }


    return 0;
}


