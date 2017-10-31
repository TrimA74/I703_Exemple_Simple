/* --------------------------Section de Code Utilisateur---------------------*/
package fr.usmb.m1isc.compilation.simple;
import java_cup.runtime.Symbol;

%%

/* -----------------Section des Declarations et Options----------------------*/
// nom de la class a generer
%class SimpleLexer
%unicode
%line   // numerotation des lignes
%column // numerotation caracteres par ligne

// utilisation avec CUP
// nom de la classe generee par CUP qui contient les symboles terminaux
%cupsym SimpleParserSym
// generation analyser lexical pour CUP
%cup

// code a ajouter dans la classe produite
%{

%}

/* definitions regulieres */

plus    = "+"
minus   = "-"
star    = "*"
divide  = "/"
modulo  = "%"
parg    = "("
pard    = ")"
sep = ";"
chiffre = [0-9]
number = {chiffre} {chiffre}*
blanc  = \s


%% 
/* ------------------------Section des Regles Lexicales----------------------*/

{blanc}+ {}
{plus}        { System.out.println("+");return new Symbol(SimpleParserSym.PLUS); }
{minus}        { System.out.println("-");return new Symbol(SimpleParserSym.MINUS); }
{star}        { System.out.println("*");return new Symbol(SimpleParserSym.STAR); }
{divide}        { System.out.println("/");return new Symbol(SimpleParserSym.DIVIDE); }
{modulo}        { System.out.println("%");return new Symbol(SimpleParserSym.MODULO); }
{parg}         { System.out.println("(");return new Symbol(SimpleParserSym.PARG); }
{pard}      { System.out.println(")");return new Symbol(SimpleParserSym.PARD); }
{sep}+        {System.out.println(";");return new Symbol(SimpleParserSym.SEP); }
{number}        { return new Symbol(SimpleParserSym.NUMBER,new Integer(yytext()));}
