#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// 1
int pesquisa(int x, int a[], int N) {
    int i = 0, j = N-1;

    while (i <= j) {
        int m = i + (j-i)/2;

        if (a[m] == x) return m;
        else if (a[m] > x) j = m - 1;
        else i = m + 1;
    }

    return -1;
}

// 2
typedef struct lint_nodo {
    int valor;
    struct lint_nodo *prox;
} *LInt;

void duplicaTodos(LInt l) {
   while (l != NULL) {
        LInt novo = malloc(sizeof(struct lint_nodo));
        novo->valor = l->valor;
        novo->prox = l->prox;

        l->prox = novo;
        l = novo->prox; 
   }
}

// 3
int expande(char s[]) {
    int j = 0;
    char str [strlen (s)];

    strcpy (str,s);

    for (int i = 1; str[i] != '\0'; i += 2) {
        char letra = str[i-1];
        int rep = str[i] - '0';
        for (int k = 0; k < rep; k++) {
            s[j++] = letra;
        }
    }

    s[j] = '\0';
    return j;
}

// 5
typedef struct abin_nodo {
    int valor;
    struct abin_nodo *esq, *dir;
} *ABin;

// devolve o numero de elementos preenchidos no array
int aBinToArray (ABin a,int n,int v[]) {
    if (a == NULL) return 0;
    if (n == 1) {
        v[0] = a->valor;
        return 1;
    } else {
        int pE = aBinToArray (a->esq,n-1,v);
        int pD = aBinToArray (a->dir,n-1,v + pE);
        return pE + pD;
    }
}

int todosIguaisArray (int v[],int N) {
    if (N == 0) return 1;

    int valor = v[0];
    for (int i = 1; i < N; i++) {
        if (v[i] != valor) return 0;
    }

    return 1;
}   

int todosIguais(ABin a, int n) {
    int v[1024];

    int N = aBinToArray (a,n,v);
    return (todosIguaisArray (v,N));
}

// 6
int calcula (char s[]) {
    int st[strlen (s)];
    int sp = 0,res;

    for (int i = 0; s[i] != '\0';i++) {
        if (s[i] != '+' && s[i] != '*') {
            st[sp++] = s[i] - '0';
        } else {    
            int x1 = st[--sp];
            int x2 = st[--sp];

            if (s[i] == '+') {
                res = x1 + x2;
            } else if (s[i] == '*') {
                res = x1*x2;
            }

            st[sp++] = res;
        }
    }

    return (st[sp-1]);
}

// Funções auxiliares
void imprimeLista (LInt l) {

    putchar ('[');
    while (l != NULL) {
        printf ("%d%c",l->valor,(l->prox == NULL) ? ']' : ',');
        l = l->prox;
    }
    putchar ('\n');

}

LInt newLInt (LInt l,int x) {
    LInt novo = malloc (sizeof (struct lint_nodo));
    novo->valor = x;
    novo->prox = l;

    return novo;
}


int main () {
    // 1
    int v1[5] = {-1,2,3,4,10};
    printf ("Pos: %d\n",pesquisa (10,v1,5));
    printf ("Pos: %d\n",pesquisa (2,v1,5));
    printf ("Pos: %d\n",pesquisa (5,v1,5));

    // 2
    LInt lista = NULL;

    lista = newLInt (lista, 3);
    lista = newLInt (lista, 2);
    lista = newLInt (lista, 1);
    duplicaTodos (lista);
    imprimeLista (lista);
    // 1 -> 2 -> 3 -> NULL

    // 3
    char string[1024] = "x3y1z4";
    printf ("Novo tamanho: %d\n",expande (string));
    printf ("%s\n",string);

    // 6
    printf ("Valor: %d\n",calcula ("34+21+*"));

    return 0;   
}