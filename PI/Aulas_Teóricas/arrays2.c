#include <stdio.h>

// Função que remove tudos os espaços
char *removeEspaços (char v[]) {
    int j = 0;

    for (int i = 0; v[i] != '\0';i++) {
        if (v[i] != ' ') v[j++] = v[i];
    }
    v[j] = '\0';

    return v;
}

// Função que concatena duas strings
char *strcat (char s[], char t[]) {
    int j = 0;

    while (s[j] != '\0') j++;

    for (int i = 0; t[i] != '\0';i++) {
        s[j++] = t[i];
    }

    s[j] = '\0';

    return s;

}


int main() {
    char s[10] = "ola";
    printf("%s\n", strcat(s,s));
    return 0;
}    