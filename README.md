# Language-project
# Lex and yacc project


This project implements a simple lexer and parser for a programming language using Flex (for lexical analysis) and Bison (for parsing).

## Files

- `lexer.l`: The lexer file describes that how to tokenize the input.
- `parser.y`: The parser file that describes the grammar and how to handle parsed tokens.
- `Makefile`: A makefile to automate the build process.
- `test.lang`: A sample input file to test the lexer and parser.

## Features

- Supports basic arithmetic operations (`+`, `-`, `*`, `/`).
- Supports control flow statements (`if`, `else`, `while`, `for`).
- Recognizes data types: integers, floats, strings, booleans (`true`, `false`).

## Requirements

- Flex
- Bison
- GCC

## Building the Project

To build the lexer and parser, run the following command in the terminal:

make