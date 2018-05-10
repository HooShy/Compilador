#include <ctype.h>
#include <stdlib.h>
#include <stdarg.h>
#include <limits.h>
typedef struct TableS{
    int tableSymbols[52];
    struct TableS * pred;
} table;

table *current; // Escopo atual.
int getValueFromTable(char c); //busca da table
void updateTable(char c, int value); //atualiza table
table *initializeList(); //Inicia a table
void addTable(); //Adiciona um escopo.
void removeTable(); //Remove o escopo atual.


table * initializeList(){
    table *list = (table *) malloc(sizeof(table));
    for(int i =0; i < 52; i++) list->tableSymbols[i] = INT_MIN; //-475869;
    list->pred = NULL;
    current = list;
    return list;
}

void addTable(){
	table *list = (table *) malloc(sizeof(table));
	for(int i =0; i < 52; i++) list->tableSymbols[i] = -475869;
	list->pred = current;
	current = list;	
}

void removeTable(){
	current = current->pred;
}

//mapeia a-zA-Z em 0-51 na table
int getIdentifierFromTable(char c){
	int index = -1;
	if(islower(c)){	
		index =  c - 'a' + 26;
	}
	else if(isupper(c)){
		index = c - 'A';
	}
	return index;	
};

int searchInTable(int index, table *toSearch){
	int value = -1;
	if (toSearch->tableSymbols[index] != -475869){
		value = toSearch->tableSymbols[index];
	}else{
		value = searchInTable(index, toSearch->pred);
	}
	return value;
}

int getValueFromTable(char c){
	int index = getIdentifierFromTable(c);
	return searchInTable(index, current);
};

void updateTable(char c, int value){
	int index = getIdentifierFromTable(c);
	current->tableSymbols[index] = value;
};
