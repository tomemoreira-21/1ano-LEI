#include <stdio.h>

typedef struct aluno {
    int numero;
    char nome[100];
    int miniT [6];
    float teste;
} Aluno;

// 1 
int nota (Aluno a) {
    int m = 0, n;

    for (int i = 0; i < 6; i++) {
        m += a.miniT[i];
    }

    n = m * 0.20 + a.teste * 0.80; 

    return ((n < 9.5 ? 0 : n));
}

// 2 
int procuraNum (int num,Aluno t[],int N) {
    int i = 0;

    while (i < N && t[i].numero <= num) {
        if (num == t[i].numero) return i;
        else i++;
    }

    return -1;
}

// 3 
void swap (Aluno *x,Aluno *y) {
    Aluno temp;

    temp = *x;
    *x = *y;
    *y = temp;
}

void ordenaPorNum (Aluno t[],int N) {

    for (int j = 0; j < N - 1; j++) {
        for (int i = 0; i < N - j - 1;i++) {
            if (t[i].numero > t[i+1].numero) 
                swap (&t[i],&t[i+1]);
        }
    }
}

// 4
void criaIndPorNum (Aluno t[],int N,int ind[]) {
    int temp;

    for (int i = 0; i < N; i++) ind [i] = i;

    for (int j = 0; j < N - 1; j++) {
        for (int k = 0; k < N - j - 1;k++) {
            if (t[ind[k]].numero > t[ind[k+1]].numero) {
                temp = ind[k];
                ind [k] = ind[k+1];
                ind[k+1] = temp;
            }
        }
    }
}

// 5 
void imprimeTurma (int ind[],Aluno t[],int N) {

    for (int j = 0; j < N; j++) {
        printf ("Número de aluno: %d\n",t[ind[j]].numero);
        printf ("Nome do aluno: %s\n",t[ind[j]].nome);
        printf ("Notas do aluno\n");
        printf ("Mini-Teste: ");
        for (int i = 0; i < 6; i++) printf ("%d ",t[ind[j]].miniT[i]);
        printf ("\nTeste: %.2f valores\n\n",t[ind[j]].teste);
    }

}

// 6
int procuraNum6 (int num, Aluno t[],int ind[],int N) {
    int i = 0;

    while (i < N && t[ind[i]].numero <= num) {
        if (t[ind[i]].numero == num) return ind[i];
        else i++;
    }

    return -1;
}


// 7
int nomeMaior (char s1[],char s2[]) {

    for (int i = 0; s1[i] != '\0';i++) {
        if (s1[i] > s2[i]) return 1;
        if (s1[i] < s2[i]) return 0;
    }

    return 0;
}

void criaIndPorNome (Aluno t[],int N,int ind[]) {
    int temp;

    for (int i = 0; i < N; i++) ind[i] = i;

    for (int j = 0; j < N - 1; j++) {
        for (int k = 0; k < N - j - 1; k++) {
            if (nomeMaior (t[ind[k]].nome,t[ind[k+1]].nome)) {
                temp = ind[k];
                ind[k] = ind[k+1];
                ind[k+1] = temp; 
        }
      }
    }
}

