#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// PARTE A
// 1
char charMaisfreq (char s[]) {
    int contagem [256] = {0};
    char maisFreq = s[0];
    int maxFreq = 0;

    if (s[0] == '\0') return 0;

    for (int i = 0; s[i] != '\0';i++) {
        contagem [s[i]]++;
        if (contagem [s[i]] > maxFreq) {
            maxFreq = contagem [s[i]];
            maisFreq = s[i];
        }
    }

    return maisFreq;
}

// 2
int maxCresc (int v[],int N) {
    int freq = 1,maxFreq = 1;

    for (int j = 0; j < N - 1; j++) {
        for (int i = j + 1; i < N; i++) {
            int valorAnt = v[i-1];
            int valorAtual = v[i];

            if (valorAtual > valorAnt) {
                freq++;
            } else {
                if (freq > maxFreq) {
                    maxFreq = freq;
                }

                freq = 1;
                break;
            }
        }

        if (freq > maxFreq) {
            maxFreq = freq;
            freq = 1;    
        }

    }

    return maxFreq;
}

// 3
typedef struct slist {
    int valor;
    struct slist *prox;
} *LInt;

LInt somasAcL (LInt l) {
    int soma = 0;
    LInt r = NULL, *ptr = &r;

    while (l != NULL) {
        soma += l->valor;
        LInt novo = malloc (sizeof (struct slist));
        novo->valor = soma;
        novo->prox = NULL;

        *ptr = novo;

        ptr = & ((*ptr)->prox);
        l = l->prox;
    }

    return r;
}

// 4
LInt rotateL (LInt l) {
    if (l == NULL || l->prox == NULL) return l;

    LInt primeiro = l;
    l = l->prox;
    primeiro->prox = NULL;
    
    LInt atual = l;
    while (atual->prox != NULL) {
        atual = atual->prox;
    }

    atual->prox = primeiro;

    return l;
}

// 5
typedef struct posicao {
    int x,y;
} Posicao;

// verifica se a posicao p2 é adjacente à posicao p1
int serAdjacente (Posicao p1,Posicao p2) {
    int x1 = p1.x, y1 = p1.y;
    int x2 = p2.x, y2 = p2.y;

    return ((x1 == x2 && y2 == y1 - 1) ||
            (x1 == x2 && y2 == y1 + 1) ||
            (y1 == y2 && x2 == x1 - 1) ||    
            (y1 == y2 && x2 == x1 + 1) );
}

int vizinhos (Posicao p,Posicao pos[],int N) {
    int c = 0;

    for (int i = 0; i < N; i++) {
        if (serAdjacente (p,pos[i])) c++;
    }

    return c;
}

// PARTE B
typedef struct nodo {
    int nlesq;
    char *linha;
    struct nodo *esq,*dir;
} *Rope;

// 1
int nlinhas (Rope r) {
    if (r == NULL) return 0;

    return (1 + nlinhas (r->esq) + nlinhas (r->dir));
}

// 2
void print (Rope r) {
    if (r == NULL) return;

    print (r->esq);
    printf ("%s ",r->linha);
    print (r->dir);
}

// 3
char *palavraLinha (int l,Rope r) {
    if (r == NULL) return NULL;

    if (l > r->nlesq) {
        return (palavraLinha (l - (r->nlesq + 1),r->dir));
    } else if (l == r->nlesq) {
        return r->linha;
    } else {
        return (palavraLinha (r->nlesq - l,r->esq));
    }
}

char indexRope (int l,int c,Rope r) {
    char *palavra = palavraLinha (l,r);

    if (palavra == NULL) return '\0';
    else {
        for (int i = 0; palavra[i] != '\0';i++) {
            if (i == c) return palavra[i];
        }
    }

    return '\0';
}

// 4
Rope concat (Rope r1,Rope r2) {
    if (r1 == NULL) return r2;
    if (r2 == NULL) return r1;

    Rope novo = malloc (sizeof (struct nodo));
    novo->linha = NULL;
    novo->nlesq = nlinhas (r1);
    novo->esq = r1;
    novo->dir = r2;

    return novo;
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
    LInt novo = malloc (sizeof (struct slist));
    novo->valor = x;
    novo->prox = l;

    return novo;
}

LInt criaLista () {
    LInt lista = NULL;

    lista = newLInt (lista,4);
    lista = newLInt (lista,3);
    lista = newLInt (lista,2);
    lista = newLInt (lista,1);

    return lista;
}

Rope newRope (char *l,int n,Rope e,Rope d) {
    Rope novo = malloc (sizeof (struct nodo));
    novo->linha = strdup (l);
    novo->nlesq = n;
    novo->dir = d;
    novo->esq = e;

    return novo;
}

Rope criaArvore () {
    Rope prog = newRope("Programação", 0, NULL, NULL);
    Rope e = newRope("é,", 0, NULL, NULL);
    Rope uma = newRope("uma", 0, NULL, NULL);
    Rope mesmo = newRope("mesmo", 0, NULL, NULL);
    Rope fixe = newRope("fixe.", 0, NULL, NULL);

    Rope imperativa = newRope("Imperativa", 1, prog, e);
    Rope definitivamente = newRope("definitivamente,", 3, imperativa, uma);

    Rope muito = newRope("muito", 1, mesmo, fixe);

    Rope disciplina = newRope("disciplina", 5, definitivamente, muito);

    return disciplina;
}


int main () {
    // PARTE A
    // 1
    printf ("Char mais frequente: %c\n",charMaisfreq ("baan"));
    printf ("Char mais frequente: %c\n",charMaisfreq ("tomass"));

    // 2
    int v[10] = {1,2,3,2,1,4,10,12,5,4};
    printf ("Maxcresc: %d\n",maxCresc (v,10));

    // 3
    LInt lista = criaLista ();
    LInt res = somasAcL (lista);
    imprimeLista (res);

    // 4
    LInt rotate = rotateL (lista);
    imprimeLista (rotate);

    // PARTE B  
    // 1
    Rope arv = criaArvore ();
    printf ("Nlinhas: %d\n",nlinhas (arv));

    // 2
    print (arv);
    putchar ('\n');

    // 3
    printf ("Char: %c\n",indexRope (7,1,arv));

    return 0;



}

