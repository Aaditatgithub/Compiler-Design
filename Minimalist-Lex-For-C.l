%{
#include <stdio.h>
#include <stdlib.h>
%}


/* Definitions section */
%option noyywrap


/* Regular expression definitions for various tokens */
DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT})*
NUMBER      {DIGIT}+
STRING      \"[^\"]*\"
INCLUDE     \#include\<{ID}\.h\>
OPERATOR    [\+\-\*/=,;<>!]
WHITESPACE  [ \t\n]+
COMMENT     "//".*


%%


{INCLUDE}           { printf("%s : PREPROCESSOR DIRECTIVE\n", yytext); }
"int"|"void"|"return"|"if"|"else"|"while"|"for"   { printf("%s : KEYWORD\n", yytext); }
{ID}                { printf("%s : IDENTIFIER\n", yytext); }
{NUMBER}            { printf("%s : NUMBER\n", yytext); }
{STRING}            { printf("%s : STRING LITERAL\n", yytext); }
{OPERATOR}          { printf("%s : OPERATOR\n", yytext); }
"(" | ")" | "{" | "}" | "[" | "]"   { printf("%s : DELIMITER\n", yytext); }
{WHITESPACE}        { /* Ignore whitespaces */ }
{COMMENT}           { /* Ignore comments */ }
.                   { printf("%s : UNKNOWN TOKEN\n", yytext); }


%%


/* No need to redefine yywrap here */


int main(int argc, char **argv) {
    yylex();  // Run the lexer
    return 0;
}


