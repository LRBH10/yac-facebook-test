#include <iostream>
#include <cstdio>


using namespace std;

extern int yyparse();
extern FILE *yyin;

int yyerror(char *msg) { cerr<<msg<< endl; }

int main()
{
  int ret = 0;

  string filename= "in.txt";

  yyin = fopen(filename.c_str(), "r");

  if (!yyin)
  {
    std::cerr << "can not parse: " << filename << "\n";
  }

  ret = yyparse();
  if (ret != 0) cerr << " ERROR to parse" << "\n";

  return ret;
}
