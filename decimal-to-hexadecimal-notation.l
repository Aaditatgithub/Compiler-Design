%{
#include <stdio.h>
#include <stdlib.h>


int replacement_count = 0;  // Counter for the number of replacements
%}


%%


[0-9]+    {
            // Convert the matched number to an integer
            int decimal_value = atoi(yytext);
            
            // Print the hexadecimal value
            printf("0x%x", decimal_value);
            
            // Increment the replacement counter
            replacement_count++;
          }


.|\n      { printf("%s", yytext); }  // Print all other characters as is


%%


int main(int argc, char **argv) {
    yylex();
    
    // Print the summary statistic to stderr
    fprintf(stderr, "Number of replacements: %d\n", replacement_count);
    
    return 0;
}


int yywrap() {
    return 1;
}
