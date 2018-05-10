%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <stdlib.h>
#include "kainan.tab.h"
extern FILE *yyin;
%}
%option yylineno


%%
"int"							 { printf("INTEGER \n");}
""                                { printf("VOID \n");}
"float"							 { printf("FLOAT \n");}
"char"							 { printf("CHARACTER \n");}
"string"						 { printf("STRING \n");}
"main"							 { printf("MAIN METHOD \n");}
"func" 							 { printf("AUXILIARY METHOD \n"); } 
"import" 						 { printf("IMPORT DATA \n"); }
"if" 						 	 { printf("IF \n"); }
"else" 						 	 { printf("ELSE \n"); }
"switch"						 { printf("SWITCH \n"); }
"case"							 { printf("CASE \n"); }
"print"							 { printf("SHOW DATA \n"); }
"scan"							 { printf("GET DATA \n"); }
"for"							 { printf("FOR \n"); }
"while"							 { printf("WHILE \n"); }
"do"							 { printf("DO \n"); }
"and"							 { printf("AND \n"); }
"not"							 { printf("NOT \n"); }
"or"							 { printf("OR \n"); }
"return"						 { printf("RETURN \n"); }
[A-Za-z]([A-Za-z]|[0-9]|_)*      { printf("ID \n"); }
\".*\"    						 { printf("STRING\n"); } 
"("								 { printf("OPEN PARENTHESIS \n"); }
")"								 { printf("CLOSE PARENTHESIS \n"); }
"{"								 { printf("OPEN KEYS \n"); }
"}"								 { printf("CLOSE KEYS \n"); }
";"								 { printf("SEMICOLON \n"); }
":"								 { printf("COLON \n"); }
"."								 { printf("DOT \n"); }
","								 { printf("COMMA \n"); }
"<="							 { printf("LESS EQUAL \n"); }
">="								{ printf("GREATER EQUAL \n"); }
">"									{ printf("BIGGER THEN \n"); } 
"<"									{ printf("LESS THEN\n"); } 
"!="						  		{ printf("DIFFERENT \n"); } 
"=="								{ printf("EQUAL \n"); } 
"="									{ printf("ASSIGNMENT \n"); }
"//".* 								{ printf("COMMENT \n"); }
"/*"[^*]*"*/" 					 { printf("COMMENT \n"); }
"++"							 { printf("INCREMENT \n"); }
\'[A-Za-z]\'						{ printf("CHARACTER\n");}
"--"							 { printf("DECREMENT \n"); }
"+"    							 { printf("PLUS\n"); } 
"-"    							 { printf("MINUS\n"); } 
"*"    							 { printf("TIMES\n"); } 
"/"    							 { printf("DIVIDE\n"); } 
"|"    							 { printf("ABS\n"); } 
-?[0-9]+ 						 { printf("NUMBER_INT %s\n", yytext); }
-?[0-9]*"."[0-9]+					 { printf("NUM_FLOAT \n"); }
\n    						     { printf("NEWLINE\n"); } 
[ \t]  							 { }
.      							 { printf("Special character %s - Linha %d \n", yytext ,yylineno); } 
%%

t
