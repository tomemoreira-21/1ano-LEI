#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 1
void swap (int v[],int x,int y) {
    int temp = v[x];
    v[x] = v[y];
    v[y] = temp;
}

int paresImpares (int v[],int N) {
    int a = 0, b = 0;

    for (int i = 0; i < N; i++) {
        if (v[b] % 2 == 0) {
            swap (v,a,b);
            a++;b++;
        } else b++;
    }

    return a;
}

// 2
typedef struct lligada {
    int valor;
    struct lligada *prox;
} *LInt;

void merge (LInt *r,LInt a,LInt b) {

    while (a != NULL && b != NULL) {
        if (a->valor < b->valor) {
            *r = a; a = a->prox;
        } else {
            *r = b; b = b->prox;
        }

        r = & ((*r)->prox);
    }

    if (a == NULL) *r = b; else *r = a;
}

// 3
void latino (int N,int m[N][N]) {
    int i = 0, k = N;

    while (i < N) {
        int primeiro = i + 1;
        int ultimo = k;

        m[i][0] = primeiro;
        int indice = 1;
        for (int j = 1; j <= N;j++) {
            if (j != primeiro) {
                m[i][indice] = j;
                indice++;
            }
        }

        i++;k--;
    }
}

// 4
typedef struct nodo {
    int valor;
    struct nodo *pai, *esq, *dir;
} *ABin;

ABin maisEsquerda(ABin a) {
    if (a == NULL) return NULL;

    while (a->esq != NULL)
        a = a->esq;

    return a;
}

ABin next(ABin a) {
    if (a == NULL) return NULL;

    if (a->dir != NULL)
        return maisEsquerda(a->dir);

    while (a->pai != NULL && a == a->pai->dir)
        a = a->pai;

    return a->pai;
}

// 5
typedef struct palavras {
    char *palavra;
    int nOcorr;
    struct palavras *esq, *dir;
} *Palavras;

void rodaDireita (Palavras *a) {
    Palavras r = (*a)->esq;
    (*a)->esq = r->dir;
    r->dir = *a;

    *a = r;
}

void rodaEsquerda (Palavras *a) {
    Palavras r = (*a)->dir;
    (*a)->dir = r->esq;
    r->esq = *a;

    *a = r;
}

// devolve 0 se adiciona um novo nodo e devolve 1 se apenas aumenta o numero de ocorrencias
int acrescentaPal (Palavras *p, char *pal) {
    if (*p == NULL) {
        Palavras novo = malloc (sizeof (struct palavras));
        novo->palavra = strdup (pal);
        novo->nOcorr = 1;
        novo->dir = NULL;
        novo->esq = NULL;

        *p = novo;
        return 0;
    } else {
        int cmp = strcmp((*p)->palavra, pal);

        if (cmp == 0) {
            (*p)->nOcorr++;
            return 1;
        } else if (cmp < 0) {
            int r = acrescentaPal (& ((*p)->dir),pal);
            rodaEsquerda (p);
            return r;
        } else {
            int r = acrescentaPal (& ((*p)->esq),pal);
            rodaDireita (p);
            return r;
        }

    }

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

void imprimeMatriz (int N,int m[N][N]) {

    for (int j = 0; j < N; j++) {
        for (int i = 0; i < N; i++) {
            printf ("%d ",m[j][i]);
        }
        putchar ('\n');
    }
    putchar ('\n');
}

LInt newLInt (LInt l,int x) {
    LInt novo = malloc (sizeof (struct lligada));
    novo->valor = x;
    novo->prox = l;

    return novo;
}

LInt criaLista1 () {
    LInt lista = NULL;

    lista = newLInt (lista,5);
    lista = newLInt (lista,3);
    lista = newLInt (lista,1);

    return lista; // 1 -> 3 -> 5 -> NULL
}

LInt criaLista2 () {
    LInt lista = NULL;

    lista = newLInt (lista,10);
    lista = newLInt (lista,2);
    lista = newLInt (lista,1);

    return lista; // 1 -> 2 -> 10 -> NULL
}

int main () {
    // 1
    int v[5] = {1,2,4,10,3};
    printf ("Pares: %d\n",paresImpares (v,5));
    for (int i = 0; i < 5; i++) 
        printf ("%d ",v[i]);
    putchar ('\n');

    // 2
    LInt lista1 = criaLista1 (),lista2 = criaLista2 (), r = NULL; 
    merge (&r,lista1,lista2);
    imprimeLista (r);

    // 3
    int m[3][3];
    latino (3,m);
    imprimeMatriz (3,m);

    return 0;
}