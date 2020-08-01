
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

/*
%token '{' '}' ';' ':' '"' NUM STR
*/

%}

%%

\{ {  return '{'; }
\} {  return '}'; }
["] {  return '"'; } 
[,] {  return ','; }
[:] {  return ':'; }
[\[] { return '['; }
[\]] { return ']'; }

[a-zA-Z]+[ a-zA-Z0-9]* { return STR; }
[0-9]+[.]?[0-9]*  { return NUM; }

[\n] { return '\n'; }
. ;

%%

int yywrap() {
  return 1;
}
