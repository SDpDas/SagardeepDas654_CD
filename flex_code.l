%{
#include <stdio.h>
#include <stdlib.h>
#include "bison_code.tab.h"
%}

%%

[0-9]+ {
    yylval = atoi(yytext);
    return NUMBER;
}

"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"\n" { return EOL; }
[ \t] { /* ignore whitespace */ }
. { yyerror("Invalid character"); }

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

