%{
    int num_lines = 0;
%}

%%

\n      { ++num_lines; }
.|\n    { }

%%

int main() {
    yylex();
    printf("%d\n", num_lines);
    return 0;
}

int yywrap() {
    return 1;  // indicate EOF
}