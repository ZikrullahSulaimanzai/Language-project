%{
#include "parser.tab.h"
%}

%%

[ \t\r\n]+                  ;

"if"                        { return IF; }
"else"                      { return ELSE; }
"while"                     { return WHILE; }
"for"                       { return FOR; }
"function"                  { return FUNCTION; }
"return"                    { return RETURN; }
"print"                     { return PRINT; }
"input"                     { return INPUT; }
"true"                      { return TRUE; }
"false"                     { return FALSE; }

"=="                        { return EQ; }
"!="                        { return NEQ; }
"<="                        { return LEQ; }
">="                        { return GEQ; }
"<"                         { return '<'; }
">"                         { return '>'; }

"&&"                        { return AND; }
"||"                        { return OR; }
"!"                         { return '!'; }

[a-zA-Z_][a-zA-Z0-9_]*      { yylval.sval = strdup(yytext); return IDENTIFIER; }
[0-9]+\.[0-9]+              { yylval.fval = atof(yytext); return FLOAT; }
[0-9]+                      { yylval.ival = atoi(yytext); return INTEGER; }
\"([^\\\"]|\\.)*\"          { yylval.sval = strdup(yytext); return STRING; }

"="                         { return '='; }
";"                         { return ';'; }
","                         { return ','; }
"("                         { return '('; }
")"                         { return ')'; }
"{"                         { return '{'; }
"}"                         { return '}'; }
"+"                         { return '+'; }
"-"                         { return '-'; }
"*"                         { return '*'; }
"/"                         { return '/'; }

.                           { printf("Unknown character: %s\n", yytext); return yytext[0]; }

%%

int yywrap(void) { return 1; }
