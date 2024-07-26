# Compiler Design
Coursework for Understanding Lex for Compiler Design

## Getting Started (On Windows)
Flex (Fast Lexical Analyzer) is a tool for generating scanners: programs that recognize lexical patterns in text. Flex is commonly used in combination with Bison, a parser generator.

### Step-by-Step Guide

1. **Download and Install Flex**
   - Visit the [Flex for Windows](http://gnuwin32.sourceforge.net/packages/flex.htm) page.
   - Click on `setup` to download the installer.
   - Run the downloaded `.exe` file to install Flex on your system.

2. **Add Flex to System PATH**
   - Open the Start menu, search for "Environment Variables," and select "Edit the system environment variables."
   - In the System Properties window, click on the "Environment Variables" button.
   - In the Environment Variables window, find the "Path" variable in the "System variables" section and select it. Click "Edit."
   - Click "New" and add the path to the directory where Flex was installed (e.g., `C:\Program Files (x86)\GnuWin32\bin`).
   - Click "OK" to close all the windows.

3. **Create a Flex File**
   - Open VSCode (or any text editor) and create a new file with the extension `.l`.
   - Add the following sample code to your `.l` file:
     ```c
     %{
     /* C code */
     %}
     %%
     [0-9]+  printf("NUMBER\n");
     [a-zA-Z]+ printf("WORD\n");
     .       printf("SINGLE CHARACTER\n");
     %%
     int main() {
         yylex();
         return 0;
     }
     ```
   - Save the file (e.g., `example.l`).

4. **Compile and Run the Flex File**
   - Open a terminal (Command Prompt or PowerShell).
   - Navigate to the directory where your `.l` file is located.
   - Run the following commands:
     ```sh
     flex example.l
     gcc lex.yy.c -o example
     ./example
     ```
   - The program will now be ready to run and test lexical patterns based on the input provided.

### References
- [Flex for Windows Installation](http://gnuwin32.sourceforge.net/packages/flex.htm)
- [GeeksforGeeks: Flex (Fast Lexical Analyzer Generator)](https://www.geeksforgeeks.org/flex-fast-lexical-analyzer-generator/)
