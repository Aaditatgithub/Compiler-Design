%{
#include <stdio.h>
%}


%%


"/*"([^*]|(\*+[^*/]))*"*/"   { printf("%s", yytext); }   // Match C-style comments and print as is


[A-Z]                       { printf("%c", yytext[0] + 'a' - 'A'); }   // Convert uppercase letters to lowercase


.|\n                        { printf("%s", yytext); }   // Print all other characters as is


%%


int main(int argc, char **argv) {
    yylex();
    return 0;
}


int yywrap() {
    return 1;
}


