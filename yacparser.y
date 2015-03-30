%{
#include <cstdio>
#include <string>
#include <iostream>
extern int yylex(void);
extern int yyerror(char *msg);
%}


%token NUM
%token PLUS MOINS DIVI MULTI


%left PLUS MOINS
%left MULTI DIVI


%start start

%%
start : exps  { std::cerr << " result = "<<$1 <<" \n"; }
    |
    ;

exps    :
     exps op exp
     {
        switch ($2){
           case 1:
           $$ = $1 + $3;
           break;
           case 2:
           $$ = $1 - $3;
           break;
           case 3:
           $$ = $1 * $3;
           break;
           case 4:
           $$ = $1 / $3;
           break;
           default:
           break;

       }
       std::cerr << $1 << "  op:'" << $2 << "' " << $3 << " "  << $$ << " \n";
     }
     | exp { $$ = $1; }
     ;

op :
     PLUS    { $$ = 1 ; }
     |MOINS  { $$ = 2 ; }
     |DIVI   { $$ = 4 ; }
     |MULTI  { $$ = 3 ; }
     ;
exp : NUM NUM   {
                   std::string str  = std::to_string($1)+std::to_string($2);
                   $$ = atoi(str.c_str());
                }
     | NUM  { $$ = $1;   };

%%

