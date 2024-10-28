%{
#include <stdio.h>
#include <string.h>


int count_a = 0;
int count_b = 0;
char current_string[1000];  // Store the current input string.
int string_idx = 0;         // Index to keep track of the string's length.
%}


%%
a { 
    count_a++; 
    current_string[string_idx++] = 'a';  // Add 'a' to the string.
}
b { 
    count_b++; 
    current_string[string_idx++] = 'b';  // Add 'b' to the string.
}
\n {
    current_string[string_idx] = '\0';   // Null-terminate the string.


    // Check if the string has an even number of 'a' and an odd number of 'b'
    if(count_a % 2 == 0 && count_b % 2 != 0) {
        printf("Valid string: %s\n", current_string);
    } else {
        printf("Invalid string: %s\n", current_string);
    }


    // Reset for the next string.
    count_a = 0;
    count_b = 0;
    string_idx = 0;
}
.   { 
    current_string[string_idx++] = yytext[0];  // Add any other characters to the string.
}
%%


int main(void) {
    yylex();
    return 0;
}


int yywrap() {
    return 1;
}
