import java_cup.runtime.Symbol;

/*
Autor: Ruana Boeira Soares
*/

%%

%class Scanner
%cup
%full
%line
%char
%eofval{
	return new Symbol(Tokens.EOF,new String("Fim do arquivo"));
%eofval}

digito = [0-9]
letra = [a-zA-Z]
id = {letra}({letra}|{digito}|"_")*
espaco = \t|\f|" "|\r|\n

%%

";"			{return new Symbol(Tokens.SEMI, yytext());}
"="			{return new Symbol(Tokens.ATRIB, yytext());}
"-"			{return new Symbol(Tokens.MENOS, yytext());}
"+"			{return new Symbol(Tokens.MAIS, yytext());}
"*"			{return new Symbol(Tokens.VEZES, yytext());}
"("			{return new Symbol(Tokens.LPAREN, yytext());}
")"			{return new Symbol(Tokens.RPAREN, yytext());}
"{"			{return new Symbol(Tokens.LBRACE, yytext());}
"}"			{return new Symbol(Tokens.RBRACE, yytext());}
","			{return new Symbol(Tokens.COMMA, yytext());}
";"         {return new Symbol(Tokens.SEMICOLON, yytext());}
"="         {return new Symbol(Tokens.ASSIGN, yytext());}
"=="        {return new Symbol(Tokens.EQ, yytext());}
"<"         {return new Symbol(Tokens.LT, yytext());}
">"         {return new Symbol(Tokens.GT, yytext());}
"bool"      {return new Symbol(Tokens.BOOL, yytext());}
"int"      {return new Symbol(Tokens.INT, yytext());}
"void"      {return new Symbol(Tokens.VOID, yytext());}
"if"        {return new Symbol(Tokens.IF, yytext());}
"else"      {return new Symbol(Tokens.ELSE, yytext());}
"return"    {return new Symbol(Tokens.RETURN, yytext());}
"true"      {return new Symbol(Tokens.TRUE, yytext());}
"false"     {return new Symbol(Tokens.FALSE, yytext());}
"not"       {return new Symbol(Tokens.NOT, yytext());}  
"and"       {return new Symbol(Tokens.AND, yytext());}    
"or"        {return new Symbol(Tokens.OR, yytext());}
"class"     {return new Symbol(Tokens.CLASS, yytext());}
{id}		{return new Symbol(Tokens.ID, yytext());}
{digito}+	{return new Symbol(Tokens.NUMERO, new Integer(yytext()));}
{espaco}	{}
.           { System.out.println("Caracter ilegal: " + yytext()); }
