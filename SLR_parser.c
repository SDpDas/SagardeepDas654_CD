#include <stdio.h>
#include <stdlib.h>

char lookahead;

void match(char);
void E(void);
void T(void);
void F(void);

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
    T();
    while (1) {
        if (lookahead == '+') {
            match('+'); T(); printf("+ ");
        } else if (lookahead == '-') {
            match('-'); T(); printf("- ");
        } else return;
    }
}

void T(void) {
    F();
    while (1) {
        if (lookahead == '*') {
            match('*'); F(); printf("* ");
        } else if (lookahead == '/') {
            match('/'); F(); printf("/ ");
        } else return;
    }
}

void F(void) {
    if (lookahead == '(') {
        match('('); E(); match(')');
    } else if (lookahead == 'i') {
        match('i'); printf("i ");
    } else {
        printf("Syntax error.\n");
        exit(1);
    }
}

