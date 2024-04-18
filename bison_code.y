%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *);
int yylex();
%}

%token NUMBER
%token ADD SUB MUL DIV
%token EOL

%%

calc: /* nothing */
    | calc line
    ;

line: EOL
    | exp EOL { printf("%d\n", $1); }
    ;

exp: factor
   | exp ADD factor { $$ = $1 + $3; }
   | exp SUB factor { $$ = $1 - $3; }
   ;

factor: term
      | factor MUL term { $$ = $1 * $3; }
      | factor DIV term { if($3 == 0) yyerror("divide by zero"); else $$ = $1 / $3; }
      ;

term: NUMBER { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
