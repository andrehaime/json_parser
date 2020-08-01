%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' ':' ',' '"' NUM STR '\n' '[' ']'

%%

SENTENCA:
	OBJECT '\n' {printf("VALIDO\n");}
	| OBJECT  {printf("VALIDO\n");}
	;


OBJECT:

  '{' CONTENT '}' 			{}
  |'{' CONTENT '}' '\n' {}
  |'{' CONTENT '\n' '}' {}
  |'{' CONTENT ',' CONTENT '}' {}
  |'{' '\n' CONTENT ',' '\n' CONTENT '\n''}' {}
  ;

CONTENT:
	KEY ':' VALUE 		{ }
	| KEY ':' OBJECT 	{ }
	;

KEY:
	'"' STR '"' { }
  ;

VALUE:
	'"' STR '"' {}
	| NUM {}
	| LIST {}
	|
	;

LIST:
	'[' C ']' {}
	;

C:
	A {}
	|
	;

A:
	NUM {}
	| '"' STR '"' {}
	| LIST {}
	| A ',' A {}
	;


%%

void yyerror(char *s) {
	printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
