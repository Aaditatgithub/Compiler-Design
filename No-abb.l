%{
#include <stdio.h>
#include <string.h>


char current_string[1000];  // Store the current input string.
int string_idx = 0;         // Index to keep track of the string's length.
int invalid = 0;            // Flag to mark if the string is invalid.
%}


%%
abb { 
    invalid = 1;  // Mark string as invalid when 'abb' is found.
    current_string[string_idx++] = 'a';
    current_string[string_idx++] = 'b';
    current_string[string_idx++] = 'b';
}
a { 
    current_string[string_idx++] = 'a';  // Add 'a' to the string.
}
b { 
    current_string[string_idx++] = 'b';  // Add 'b' to the string.
}
\n {
    current_string[string_idx] = '\0';   // Null-terminate the string.


    if(invalid) {
        printf("Invalid string: %s\n", current_string);
    } else {
        printf("Valid string: %s\n", current_string);
    }


    // Reset for the next string.
    string_idx = 0;
    invalid = 0;
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


