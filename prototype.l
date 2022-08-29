%{

#include "utils/enums.h"

%}

dig         [0-9]
alpha       [A-Z|a-z]
id          ({alpha}|\_)({alpha}|{dig}|\_)*
num_flut    [-+]?{dig}{dig}*\.{dig}{dig}*
num_int     [-+]?{dig}{dig}*

continue    "continue"
pare        "pare"
se          "se"
senao       "senão"
enquanto    "enquanto"
faca        "faça"
para        "para"
escolha     "escolha"
caso        "caso"
retorne     "retorne"
leia        "leia"
imprima     "imprima"

var         "var"

int         "int"

dois_pontos ":"
ponto_virg  ";"

erro "."

%%

{num_flut} {
  printf("TOKEN: FLUTUANTE\t");
  printf("VALOR: %s\t", yytext);
  printf("\n");
}

{num_int} {
  printf("TOKEN: INTEIRO\t");
  printf("VALOR: %s\t", yytext);
  printf("\n");
}

{continue} {
  printf(">> Token: CONTINUE (id %d)\n", CONTINUE);
  return CONTINUE;
}
{pare} { printf("TOKEN: PARE\n");}
{se} { printf("TOKEN: SE\n");}
{senao} { printf("TOKEN: SENAO\n");}
{enquanto} { printf("TOKEN: ENQUANTO\n");}
{faca} { printf("TOKEN: FACA\n");}

{para} { printf("TOKEN: PARA\n");}
{escolha} { printf("TOKEN: ESCOLHA\n");}
{caso} { printf("TOKEN: CASO\n");}
{retorne} { printf("TOKEN: RETORNE\n");}
{imprima} { printf("TOKEN: IMPRIMA\n");}

{var} { printf("TOKEN: VAR\n");}

{int} { printf("TOKEN: INT\n");}

{dois_pontos} { printf("TOKEN: DOIS_PONTOS\n");}
{ponto_virg} { printf("TOKEN: PONTO_VIRGULA\n");}

{id} {
  printf("TOKEN: ID\t");
  printf("VALOR: %s\t", yytext);
  printf("\n");
}

%%

int yywrap(){}
int main(int argc, char **argv){
  yylex();
  return 0;
}