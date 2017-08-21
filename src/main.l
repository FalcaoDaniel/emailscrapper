%{
#include <stdio.h>

/*

COMECOFIM [0-9a-zA-Z] //condição do começo e do fim do email.

MEIO    [-0-9a-zA-Z._] //sequência intermediária.

VALIDO   {COMECOFIM}+{MEIO}*{COMECOFIM}+@{COMECOFIM}+([-._]{COMECOFIM}+)* //formato de e-mail padrão válido.


*/


%}


COMECOFIM [0-9a-zA-Z]

MEIO    [-0-9a-zA-Z._] 

VALIDO   {COMECOFIM}+{MEIO}*{COMECOFIM}+@{COMECOFIM}+([-._]{COMECOFIM}+)*

%%

{VALIDO} {

		printf("%s\n", yytext);

	}


{VALIDO}[-_] {

			; //bug do teste 5, maior match.

	      }


.|\n|\s     ;

%%

int main() {
  yylex();
  return 0;
}
