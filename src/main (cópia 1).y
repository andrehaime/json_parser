%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' ':' ';' '"' NUM STR '\n'

%%

SENTENCA:
	OBJECT '\n' {printf("VALIDO\n");}
	| OBJECT  {printf("VALIDO\n");}
	;


OBJECT:
  '{' CONTENT '}' {}
  |'{' CONTENT '\n' '}' {}
  |'{''\n' CONTENT  '}' {}
  |'{''\n' CONTENT '\n''}' {}
  |'{' CONTENT '}' '\n' {}

  ;

CONTENT:
  '"' STR '"' ':' '"' STR '"' {}
	| '"' STR '"' ':' NUM {}
	| '"' STR '"' ':' OBJECT {}
	| '"' STR '"' ':' NUM '\n'{}
	; 



%%

void yyerror(char *s) {
	printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
