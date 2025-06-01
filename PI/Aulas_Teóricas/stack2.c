#include <stdio.h>
#define MAX 2

typedef struct {
    char string [MAX];
    int tam;
} stack;

/*
Objetivo: Utilizar a stack para verificar se os parênteses estão corretos
Lógica de Funcionamento: Percorrer a string caractere por caractere.
1. Sempre que encontrarmos um '(', empilhamos na stack.
2. Sempre que encontrarmos um ')', verificamos:
    - Se a stack estiver vazia, significa que há um ')' sem um '(' correspondente → Erro.
    - Caso contrário, removemos o '(' correspondente da stack.

3. No final, se a stack não estiver vazia, significa que há parênteses abertos sem fechamento → Erro.
*/

void push(stack *s, char c) {
    if (s->tam < MAX) {
        s->string[s->tam++] = c;
    }
}

// Função para eliminar um caractere da stack
void pop(stack *s) {
    if (s->tam > 0) {
        s->tam--;  
    }
}

void parentesesCorretos (char *expressao) {
    int r = 0;
    stack s;
    s.tam = 0;

    for (int i = 0; expressao[i] != '\0';i++) {
        if (expressao [i] == '(') {
            push (&s,'(');
        }

        else if (expressao [i] == ')') {
                if (s.tam == 0) {
                    r = -1;
                    break;
                } 
                pop (&s);
            }
    }

    if (s.tam != 0) r = -1;

    if (r == -1) printf ("Erro! Existem parênteses que não estão fechados\n");
    else printf ("Sucesso! Todos os parênteses estão fechados\n");
}

int main() {
    char expr1[] = "((a+b) = 2)";         // Correto
    char expr2[] = "(a+b) * (c+d) = 4";   // Correto
    char expr3[] = "((a+b = 2)";          // Incorreto
    char expr4[] = "())(";                // Incorreto

    printf("Expressão 1: %s -> ", expr1);
    parentesesCorretos(expr1);

    printf("Expressão 2: %s -> ", expr2);
    parentesesCorretos(expr2);

    printf("Expressão 3: %s -> ", expr3);
    parentesesCorretos(expr3);

    printf("Expressão 4: %s -> ", expr4);
    parentesesCorretos(expr4);

    return 0;
}


