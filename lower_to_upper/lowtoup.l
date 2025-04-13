%{
#include <stdio.h>
%}

%option noyywrap

LOWER [a-z]
UPPER [A-Z]

%%

[\t]+                   ;  // Ignore tabs/whitespace

{UPPER}                 {
                          printf("%c", yytext[0]);
                        }

{LOWER}                 {
                          printf("%c", yytext[0] - 32); // Convert to uppercase
                        }

.                       { printf("%c", yytext[0]); }

\n                      { return 0; }

%%

int main() {
    yylex();
    return 0;
}
