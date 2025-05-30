# Makefile for lexer and parser 

LEX=flex
YACC=bison
CC=gcc

LEX_FILE=lexer.l
YACC_FILE=parser.y

LEX_C=lex.yy.c
YACC_C=parser.tab.c
YACC_H=parser.tab.h

OUT=parser

.PHONY: all clean

all: $(OUT)

$(YACC_C) $(YACC_H): $(YACC_FILE)
	$(YACC) -d $<

$(LEX_C): $(LEX_FILE) $(YACC_H)
	$(LEX) $<

$(OUT): $(YACC_C) $(LEX_C)
	$(CC) -o $@ $(YACC_C) $(LEX_C) -lfl

clean:
	rm -f $(LEX_C) $(YACC_C) $(YACC_H) $(OUT)
