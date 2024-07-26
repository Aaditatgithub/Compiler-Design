# Compiler-Design
Coursework for understanding lex for compiler design

  1. [Getting-started](getting-started)

## Getting Started (On Windows)
Flex (Fast Lexical Analyzer) is a tool for generating scanners: programs that recognize lexical patterns in text. Flex is commonly used in combination with Bison, a parser generator.
1. https://gnuwin32.sourceforge.net/packages/flex.htm - install the flex compiler for windows. click on `setup`
2. Run the exe file installed on the system
3. Add the path to binaries of flex in system path variable.
4. Open vscode, create a file with extension `".l"` with appropriate sample code. Enter the appropriate code in the file.... refer https://www.geeksforgeeks.org/flex-fast-lexical-analyzer-generator/ for the same
5. Enter command
      lex <filename>.l
      gcc lex.yy.c
      ./a.out

