%{
#include "parser.tab.h"  // Include token definitions from Yacc/Bison
%}


%%


[ \t\n]+          ;                   // Ignore whitespaces
[a-zA-Z]          { return VAR; }      // Variable token (single letters a, b, c, etc.)
[0-9]+            { yylval = atoi(yytext); return NUMBER; } // Number token
"="               { return '='; }      // Assignment operator
"*"               { return '*'; }      // Multiplication operator
"+"               { return '+'; }      // Addition operator
"-"               { return '-'; }      // Subtraction operator
"/"               { return '/'; }      // Division operator
"("               { return '('; }      // Left parenthesis
")"               { return ')'; }      // Right parenthesis


%%


int yywrap() {
    return 1;  // End of input
}


Parser.y
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


void yyerror(const char *s);
extern int yylex(void);
extern char* yytext;  // This holds the text of the current token
%}


%token VAR NUMBER


%left '+' '-'
%left '*' '/'


%%


stmt:
      VAR '=' expr { printf("Assignment: %s = %d\n", yytext, $3); }
    ;


expr:
      expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | '(' expr ')'  { $$ = $2; }
    | NUMBER        { $$ = $1; }
    | VAR           { $$ = 10; /* Sample value for variables like a, b, c */ }
    ;


%%


void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}


int main(void) {
    printf("Enter an expression (e.g., x = a * b + c):\n");
    return yyparse();
}
