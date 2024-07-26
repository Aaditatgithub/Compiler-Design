%{
#include <stdio.h>
%}

%%
"0"            { printf("Matched 0\n"); }
"1"            { printf("Matched 1\n"); }
"0+1*"         { printf("Matched 0 followed by zero or more 1s\n"); }
"1+0*"         { printf("Matched 1 followed by zero or more 0s\n"); }
[01]+          { printf("Matched sequence of 0s and 1s: %s\n", yytext); }
.              { printf("Unmatched character: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}
