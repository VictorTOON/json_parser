
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%

\"[a-zA-Z0-9\.\,\-\:\;\ ]+\" {
  return T;
}

[0-9]+ {
  return I;
}

[0-9]+\.[0-9]+ {
  return F;
}

[\{] {
  return *yytext;
}

[\}] {
  return *yytext;
}

[,] {
  return *yytext;
}

[:] {
  return *yytext;
}

[\[] {
  return *yytext;
}

[\]] {
  return *yytext;
}

[\[][\]] {
  return abreFecha;
}

[[:space]] ;
[\n]+ ;
. ;

%%

int yywrap() {
  return 1;
}
