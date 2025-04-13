%{
#include <stdio.h>
#include <string.h>

void reverse_and_print(char *word) {
    int len = strlen(word);
    for (int i = len - 1; i >= 0; i--) {
        putchar(word[i]);
    }
}
%}

%option noyywrap

WORD   [a-zA-Z]+

%%

{WORD}  { reverse_and_print(yytext); }

.       { putchar(yytext[0]); }

%%

int main() {
    printf("Enter your text (Ctrl+D to end input on Linux/macOS, Ctrl+Z on Windows):\n");
    yylex();
    return 0;
}
