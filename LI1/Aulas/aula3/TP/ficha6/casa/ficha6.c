#include <stdio.h>
#include <stdlib.h>
#define Max 100

typedef struct staticStack {
    int sp;
    int values [Max];
    } STACK, *SStack;

// 1 
// a) 
void SinitStack (SStack s) {
    s->sp = 0;
}

// b) 
int SisEmpty (SStack s) {
    return (s->sp == 0);
}

// c) 
int Spush (SStack s,int x) {
    int r = 1;

    if (s->sp < Max) {
        s->values [s->sp ++] = x;
        r = 0;
    }

    return r;
}

// d) 
int Spop (SStack s,int *x) {
    int r = 1;
    
    if (!SisEmpty (s)) {
        *x = s->values[--s->sp];
        r = 0;
    }

    return r;
}

// e) 
int Stop (SStack s,int *x) {
    int r = 1;

    if (!SisEmpty (s)) {
        *x = s->values[s->sp - 1];
        r = 0;
    }

    return r;
}

// Função extra para ler os valores da Stack
void printStack(SStack s) {
    printf("Pilha: ");
    for (int i = 0; i < s->sp; i++) {
        printf("%d ", s->values[i]);
    }
    printf("\n");
}

// 2 
typedef struct staticQueue {
    int front; // Indice do primeiro elemento da fila
    int length; // Número de elementos atualmente na fila
    int values [Max];
} QUEUE, *SQueue;

// a) 
void SinitQueue (SQueue q) {
    q->front = 0;
    q->length = 0;
}

// b) 
int SisEmptyQ (SQueue q) {
    return (q->length == 0);
}

// c) 
int Senqueue (SQueue q, int x) {
    int r = 1;

    if (q->length < Max) {
        q->values[(q->front + q->length) % Max] = x;
        q->length ++;
        r = 0; 
    }

    return r;
}

// d) 
int Sdequeue (SQueue q, int *x) {
    int r = 1;

    if (!SisEmptyQ(q)) {
        *x = q->values[q->front++];
        q->length--;
        r = 0;
    }

    return r;
}

// e)
int Sfront (SQueue q,int *x) {
    int r = 1;

    if (!SisEmptyQ (q)) {
        *x = q->values[q->front];
        r = 0;
    }

    return r;
}

// Função extra para ler os valores da Queue
void printQueue(SQueue q) {
    printf("Queue: ");
    for (int i = q->front; i < q->front + q->length; i++) {
        printf("%d ", q->values[i]);
    }
    printf("\n");
}

// 3
typedef struct dinStack {
    int size; // guarda o tamanho do array values
    int sp;
    int *values;
    } *DStack;

// a) 
void SinitDinStack (DStack d) {
    d->size = 1;  
    d->sp = 0;
    d->values = malloc(d->size * sizeof(int));  
}

// b) 
int SisDinEmpty (DStack d) {
    return (d->sp == 0);
}

// c) 
int SpushDin (DStack d,int x) {
    int *t;

    if (d->sp == d->size) {
        t = d->values;
        d->values = malloc (2*d->size*sizeof (int));
        for (int i = 0; i < d->size;i++) d->values[i] = t[i];
        free (t);
        d->size *= 2;
    }   

    d->values[d->sp++] = x;

    return 0;
}

// d) 
int SpopDin (DStack d,int *x) {
    int r = 1;

    if (!SisDinEmpty (d)) {
        *x = d->values[--d->sp];
        r = 0;
    }
    
    return r;
}

// e) 
int StopDin (DStack d,int *x) {
    int r = 1;

    if (!SisDinEmpty (d)) {
        *x = d->values[d->sp - 1];
        r = 0;
    }
    
    return r;
}

// 4 
typedef struct dinQueue {
    int size; // guarda o tamanho do array values
    int front; // Indice do primeiro elemento da fila
    int length; // Número de elementos atualmente na fila
    int *values;
} *DQueue;

// a) 
void SinitDinQueue (DQueue q) {
    q->size = 1;
    q->front = 0;
    q->length = 0;
    q->values = malloc (q->size*sizeof (int));
}

// b) 
int SisEmptyDinQueue (DQueue q) {
    return (q->length == 0);
}

// c) 
int SenDinQueue (DQueue q,int x) {
    int *t;

    if (q->length == q->size) {
        t = q->values;
        q->values = malloc (2*q->size*sizeof (int));
        for (int i = 0; i < q->size;i++) q->values[i] = t[(q->front + i) % q->size];
        free (t);
        q->front = 0;
        q->size *= 2;
    }

    q->values [(q->front + q->length) % q->size] = x;
    q->length++;

    return 0;
}

// d) 
int SdeDinqueue (DQueue q,int *x) {
    int r = 1;

    if (!SisEmptyDinQueue (q)) {
        *x = q->values[q->front++];
        q->front = (q->front + 1) % q->size;
        q->length --;
        r = 0;
    }

    return r;
}

// e) 
int SfrontDinqueue (DQueue q,int *x) {
    int r = 1;

    if (!SisEmptyDinQueue (q)) {
        *x = q->values[q->front];
        r = 0;
    }

    return r;
}


