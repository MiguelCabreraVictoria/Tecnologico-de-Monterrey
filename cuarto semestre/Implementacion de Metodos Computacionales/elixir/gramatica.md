# Lenguajes libres de contexto
- Miguel Angel Cabrera Victoria
- A01782982

Objetivo: Implementar un BNF Y EBNF de los modulos y funciones en el lenguaje elixir.

## Modulos
### BNF
```ebnf modulos
    <module_declaration>::= defmodule <module_name> <do_syntax>
    <module_name>::= <atom>
    
    <do_syntax>::= do <statement_list> end

    <statement_list>::= <statement>
    <statement>::= <function_declaration> | <variable_declaration> | <function_call> | <if_statement>

    <function_declaration>::= def <function_name> (<parameters>) <do_syntax>
    <function_name>::= <name>

    <parameters>::= <parameter> | (, <parameter>)
    <parameter>:: <atom>

    <variable_declaration>::= <variable_name> = <expression>
    <function_call>::= <function_name> (<arguments>)

    <arguments>::= <expression> | (, <expression>)

    <if_condition>::= if <condition> <do_syntax> (else <do_syntax>) end
    
    <condiion>::= <expression>

```
### EBNF
``` ebnf modulos

    <module_declaration> ::= "defmodule" <module_name> <do_syntax>

    <module_name> ::= <atom>

    <do_syntax> ::= "do" <statement_list> "end"

    <statement_list> ::= <statement> {<statement>}

    <statement> ::= <function_declaration> | <variable_declaration> | <function_call> | <if_statement>

    <function_declaration> ::= "def" <function_name> ["(" [<parameters>] ")"] <do_syntax>

    <function_name> ::= <name>

    <parameters> ::= <parameter> {"," <parameter>}

    <parameter> ::= <atom>

    <variable_declaration> ::= <variable_name> "=" <expression>

    <function_call> ::= <function_name> ["(" [<arguments>] ")"]

    <arguments> ::= <expression> |  {"," <expression>}

    <if_statement> ::= "if" <condition> <do_syntax> [("else" <do_syntax>)] "end"

    <condition> ::= <expression>

    
```

## Funciones
### BNF
```bnf funcion
    <function_declaration> ::= def <function_name> ( <parameters> )<do_syntax>

    <function_name> ::= <name>

    <parameters> ::= <parameter> | (, <parameter>)

    <parameter> ::= <atom>

    <do_syntax> ::= do <statement_list> end

    <statement_list> ::= <statement>

    <statement> ::= <variable> | <function_call> | <if_statement>

    <variable> ::= <variable_name> = <expression>

    <function_call> ::= <function_name> ( <arguments> )

    <arguments> ::= <expression> | (, <argument>)

    <if_condition> ::= if <condition> do <statement_list> (else <statement_list>) end

    <expression> ::= <variable_name> | <function_call>

```
### EBNF
``` ebnf funcion

        <function_declaration>::= "def" <function_name> "(" [<parameters>] ")" <do_syntax>
        
        <function_name> ::= <name>

        <parameters> ::= <parameter> {"," <parameter>}
        <parameter> ::= <atom>  

        <do_syntax> ::= "do" <statement_list> "end"

        <statement_list> ::= <statement> {<statement>}
        <statement> ::= <variable> | <function_call> | <if_statement>

        <variable> ::= <variable_name> "=" <expression>

        <function_call> ::= <function_name> "(" [<arguments>] ")"

        <arguments> ::= <expression> {"," <expression>}

        <if_condition> ::= "if" <condition> "do" <statement_list> ["else" <statement_list>] "end"

        <expression> ::= <variable_name> | <function_call>

```



