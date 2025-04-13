%{
#include <stdio.h>
#include <string.h>

char smallest[1000];
int first = 1;
%}

%option noyywrap

WORD   [a-zA-Z]+
%%

{WORD}  {
            if (first) {
                strcpy(smallest, yytext);
                first = 0;
            } else if (strlen(yytext) < strlen(smallest)) {
                strcpy(smallest, yytext);
            }
        }

.|\n    ;  // Ignore everything else (punctuation, whitespace, etc.)

%%

int main() {
    printf("Enter your text (Ctrl+D to end input on Linux/macOS, Ctrl+Z on Windows):\n");
    yylex();
    if (!first) {
        printf("Smallest word: %s\n", smallest);
    } else {
        printf("No words found.\n");
    }
    return 0;
}
