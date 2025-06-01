#include <stdio.h> 

// Funções sobre strings
// 1 
int serVogal (char c) {
    char vogais [] = {'A','E','I','O','U','a','e','i','o','u'};

    for (int i = 0; vogais [i] != '\0';i++) {
        if (c == vogais[i]) return 1;
    } 

    return 0;
}

int contaVogais (char *s) {
    int c = 0; 

    for (int i = 0; s[i] != '\0';i++) {
        if (serVogal (s[i])) c++;
    }

    return c;
}

// 2
int retiraVogaisRep (char *s) {
    int r = 0, j = 1;

    for (int i = 1; s[i] != '\0';i++) {
        if (serVogal (s[i]) && s[i] == s[i-1]) r++;
        else s[j++] = s[i];
    }
            
    s[j] = '\0';

    return r;
}

// 3
int duplicaVogais (char *s) {
    int len = 0,pos, c = 0; 

    while (s[len] != '\0') len++;

    for (int i = 0; s[i] != '\0';i++) {
        if (serVogal (s[i])) {
            pos = i;
            for (int j = len; j > pos;j--) s[j] = s[j-1];
            
            s[pos+1] = s[i];
            len++;
            i++;
            c++;
        }
    }

    s[len] = '\0';

    return c;
}


// Arrays ordenados
// 1 
int ordenado (int v[],int N) {

    for (int i = 1; i < N; i++) {
        if (v[i] < v[i-1]) return 0;
    }

    return 1;
}

// 2 
void merge (int a[],int na,int b[],int nb,int r[]) {
    int i = 0, j = 0, k = 0;

    while (i < na && j < nb) {
        if (a[i] < b[j]) {
            r[k++] = a[i++];
        } else {
            r[k++] = b[j++];
        }
    }

    while (i < na) r[k++] = a[i++];

    while (j < nb) r[k++] = b[j++];

}

// 3 
int partition1 (int v[],int N,int x) {
    int a = 0,temp;

    for (int i = 0; i < N; i++) {
        if (v[i] <= x) {
            temp = v[a];
            v[a] = v[i];
            v[i] = temp; 
            a++;
        }
    }

    return a;
}

int partition2 (int v[],int N,int x) {
    int a = 0, b = 0,temp; 

    for (int i = 0; i < N; i++) {
        if (v[b] <= x) {
            temp = v[b];
            v[b] = v[a];
            v[a] = temp;
            b++;a++;
        } else {
            b++;
        }
    }

    return a;
}

int main () {
    int s[] = {10,1,2,8};
    printf ("%d\n",partition2(s,4,3));
    return 0;
}