%{
#include <stdio.h>
#include "tab.c"
%}

%union
{
	char	*sval;
};

%token NUMBER_INT
%token PLUS
%token MINUS
%token TIMES
%token DIVIDE
%token WHILE
%token FOR

%token OPEN_PARENTHESIS
%token CLOSE_PARENTHESIS
%token OPEN_KEYS
%token CLOSE_KEYS
%token SEMICOLON

%token IF
%token ELSE
%token INTEGER
%token FLOAT
%token CHARACTER

%token COLON
%token AUXILIARY_METHOD
%token INCREMENT
%token DECREMENT
%token STRING

%token CASE
%token SHOW_DATA
%token GET_DATA
%token DO
%token NOT
%token OR

%token AND
%token RETURN
%token MAIN_METHOD
%token SWITCH

%token DOT
%token COMMA
%token GREATER_EQUAL
%token BIGGER_THEN
%token LESS_EQUAL
%token LESS_THEN

%token DIFFERENT
%token EQUAL
%token ASSIGNMENT
%token NEWLINE
%token NUMBER_FLOAT
%token ID
%token VOID

%start Principal
%%
Principal:
	comandos
;

comandos:
    comandos comando
    | comando
    | main
;

main:
    INTEGER MAIN_METHOD OPEN_PARENTHESIS CLOSE_PARENTHESIS OPEN_KEYS stmts CLOSE_KEYS
;

stmts:
    stmts stmt
    |stmt
;

stmt:
    var_declara
    |exp
;

comando:
    var_declara
    | func_declara 
;

var_declara:
    tipo ID SEMICOLON
    |tipo ID ASSIGNMENT numbertips SEMICOLON
;

numbertips:
    NUMBER_INT
    |NUMBER_FLOAT
;

tipo:
    INTEGER
    |FLOAT
    |CHARACTER
;

func_declara:
     tipo ID OPEN_PARENTHESIS params CLOSE_PARENTHESIS OPEN_KEYS stmt CLOSE_KEYS 
;

params:
    lista_param
    |VOID
;

lista_param:
    lista_param COMMA param
    |param
;

param:
    tipo ID
;

exp:
    exp PLUS fator 
    |exp MINUS fator 
    |fator
;

fator:
    fator TIMES termo    
    |fator DIVIDE termo
    |termo
;

termo:
    NUMBER_INT
    |NUMBER_FLOAT
    |ID
;

%%

int yyerror(char *s) {
  printf("yyerror : %s\n",s);
}

int main(void) {
  yyparse();
}
