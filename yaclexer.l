%{
#include <cstdio>

#include "YACParser.hpp"
%}


LETTRE   [a-zA-Z]
CHIFFRE  [0-9]
MOT      {LETTRE}+
NOMBRE   {CHIFFRE}+

%option noyywrap

%%
{NOMBRE}  {
            ECHO;
            yylval = atoi(yytext);
            return NUM;
           }
\n         { }
\+         {
             ECHO;
             return PLUS;
           }
\-         {
             ECHO;
             return MOINS;
           }
\*         {
             ECHO;
             return MULTI;
           }
\/         {
             ECHO;
             return DIVI;
           }
.        printf("\nNi mot, ni nombre :%s", yytext);


