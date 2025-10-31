%{


// --- List of all C keywords ---
char *keywords[] = {
"auto","break","case","char","const","continue","default","do","double","else",
"enum","extern","float","for","goto","if","int","long","register","return",
"short","signed","sizeof","static","struct","switch","typedef","union",
"unsigned","void","volatile","while"
};


// --- Function to check if a word is a keyword ---
int isKeyword(char *word) {
int i;
for (i = 0; i < 32; i++) {
if (strcmp(keywords[i], word) == 0)
return 1;
}
return 0;
}
%}


%%


[ \t\n]+ ; /* Ignore whitespace */


"//".* { /* Ignore single-line comments */ }
"/*"([^*]|\*+[^*/])*\*+"/" { /* Ignore multi-line comments */ }


[a-zA-Z_][a-zA-Z0-9_]* {
if (isKeyword(yytext)) {
printf("Keyword: %s\n", yytext);
keywordCount++;
} else {
printf("Identifier: %s\n", yytext);
identifierCount++;
}
}


[0-9]+\.[0-9]+ { printf("Float constant: %s\n", yytext); literalCount++; }
[0-9]+ { printf("Integer constant: %s\n", yytext); literalCount++; }
\"([^\\\"]|\\.)*\" { printf("String literal: %s\n", yytext); literalCount++; }
\'([^\\\']|\\.)\' { printf("Character literal: %s\n", yytext); literalCount++; }


"=="|"!="|"<="|">="|"++"|"--"|"+="|"-="|"*="|"/="|"&&"|"||"|[-+*/%=<>&|!~^?:] {
printf("Operator: %s\n", yytext);
operatorCount++;
}


. ; /* Ignore any other characters */


%%


// --- Main Function ---
int main(int argc, char *argv[]) {
if (argc < 2) {
printf("Usage: %s <sourcefile>\n", argv[0]);
return 1;
}


FILE *fp = fopen(argv[1], "r");
if (!fp) {
printf("Cannot open file: %s\n", argv[1]);
return 1;
}


yyin = fp;
yylex();
fclose(fp);


printf("\n--- Token Summary ---\n");
printf("Keywords: %d\n", keywordCount);
printf("Identifiers: %d\n", identifierCount);
printf("Operators: %d\n", operatorCount);
printf("Literals: %d\n", literalCount);


return 0;
}


// --- yywrap Function (needed for Flex on some systems) ---
int yywrap() { return 1; }