%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' T ':' ',' I F '[' ']' abreFecha

%%
S: 
  C S {printf("VALIDO\n");}
  |
  ;

Y:
  T {}
  | I {}
  | F {}
  ;

C:
  '{' E '}' {}
  |
  ;

L:
  T {}
  | I {}
  | F {}
  | L ',' L {}
  | L ',' '[' L ']' {}
  | abreFecha {}
  ;

E:
  E ',' E {}
  | T ':' Y {}
  | T ':' C {}
  | T ':' '[' L ']' {}
  | T ':' abreFecha {}
  ;

%%

void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;
//T ',' T {printf("5 ");}
}
