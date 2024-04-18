#include <stdio.h>
#include <stdlib.h>

char lookahead;

void match(char);
void E(void);
void Eprime(void);

int main(void) {
    lookahead = getchar();
    E();
    if (lookahead == '\n') {
        printf("Syntax is correct.\n");
    } else {
        printf("Syntax error.\n");
    }
    return 0;
}

void match(char t) {
    if (lookahead == t) {
        lookahead = getchar();
    } else {
        printf("Syntax error.\n");
        exit(1);
    }
}

void E(void) {
    if (lookahead == 'i') {
        match('i');
        Eprime();
    } else if (lookahead == '(') {
        match('(');
        E();
        match(')');
        Eprime();
    } else {
        printf("Syntax error.\n");
        exit(1);
    }
}

void Eprime(void) {
    if (lookahead == '+') {
        match('+');
        E();
    } else if (lookahead == ')' || lookahead == '\n') {
        return;
    } else {
        printf("Syntax error.\n");
        exit(1);
    }
}
