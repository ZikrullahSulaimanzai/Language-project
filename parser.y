%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);

typedef struct {
    int ival;
    float fval;
    char *sval;
} YYSTYPE;

#define YYSTYPE YYSTYPE
%}

%union {
    int ival;
    float fval;
    char *sval;
}

%token <ival> INTEGER
%token <fval> FLOAT
%token <sval> STRING IDENTIFIER

%token IF ELSE WHILE FOR FUNCTION RETURN PRINT INPUT
%token TRUE FALSE

%debug


%token EQ NEQ LEQ GEQ AND OR

%left OR
%left AND
%left EQ NEQ
%left '<' '>' LEQ GEQ
%left '+' '-'
%left '*' '/'
%right '!'
%right '='

%%

program:
    program statement
    | statement
    ;

statement:
    expression ';'
    | IF '(' expression ')' statement
    | IF '(' expression ')' statement ELSE statement
    | WHILE '(' expression ')' statement
    | FOR '(' expression ';' expression ';' expression ')' statement
    | '{' program '}'
    | RETURN expression ';'
    | PRINT '(' expression ')' ';'
    | INPUT '(' IDENTIFIER ')' ';'
    ;

expression:
    INTEGER
    | FLOAT
    | STRING
    | TRUE
    | FALSE
    | IDENTIFIER
    | IDENTIFIER '=' expression
    | expression '+' expression
    | expression '-' expression
    | expression '*' expression
    | expression '/' expression
    | expression EQ expression
    | expression NEQ expression
    | expression '<' expression
    | expression '>' expression
    | expression LEQ expression
    | expression GEQ expression
    | expression AND expression
    | expression OR expression
    | '!' expression
    | '(' expression ')'
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
