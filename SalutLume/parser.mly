%{
		open Path;;
%} 
%token <int> INT
%token <string> VARINT VARBOOL VARSIR VARSET
%token <string> SIR
%token <string> INPUT
%token <string> CONTORIZARE
%token <bool> ADEVARAT
%token <bool> FALS
%token INCEPUT SFARSIT 
%token PLUS MINUS INMULTIT IMPARTIT REST
%token MAI_MIC MAI_MARE MAI_MIC_EGAL MAI_MARE_EGAL EGAL DIFERIT NU SAU SI
%token SEMNUL_EXCLAMARII PARANTEZA_STANGA PARANTEZA_DREAPTA
%token ATRIBUIRE
%token PUTERE
%token CONCATENARE
%token ADAUGA ELIMINA
%token DACA ATUNCI ALTFEL OPRESTE
%token PENTRU IN EXECUTA TERMINA
%token AFISEAZA
%token LASA
%left EGAL DIFERIT
%left MAI_MIC MAI_MARE MAI_MIC_EGAL MAI_MARE_EGAL
%left PLUS MINUS
%left INMULTIT IMPARTIT
%left REST
%right SAU 
%right SI
%right CONCATENARE
%nonassoc NOT UMINUS
%start baza
%type <Path.baza> baza										/* main */ 
%type <Path.program> program								/* program body */ 
%type <Path.afirmatie> afirmatie							/* statement */ 
%type <Path.pentruExecuta> pentru_executa					/* for loops */ 
%type <Path.dacaAtunciAltfel> daca_atunci_altfel			/* if else statements */ 
%type <Path.proces> proces											
%type <Path.operatie> operatie
%type <Path.procesIntreg> proces_intreg
%type <Path.variabilaIntreg> intreg_sau_variabilaIntreg
%type <Path.procesSir> proces_sir
%type <Path.variabilaSir> sir_sau_variabilaSir
%type <Path.procesBoolean> proces_boolean
%type <Path.variabilaBoolean> boolean_sau_variabilaBoolean
%type <Path.seteazaProces> seteaza_proces
%type <Path.declarare> declarare							/* declare */ 
%type <Path.afisareOp> afisare								/* print */ 
%type <string> set
%type <Path.mutareAct> mutare								/* mutation */ 
%%

baza:
 | INCEPUT program SFARSIT 					{ Program $2 }
;

program:
 | afirmatie                    			{ Afirmatie $1 }
 | afirmatie program               			{ Program_de_afirmatii ($1, $2) }
;

afirmatie:
 | pentru_executa              				{ Afirmatie_Pentru $1 }
 | daca_atunci_altfel               		{ Afirmatie_Daca $1 }   
 | proces SEMNUL_EXCLAMARII	   			    { Afirmatie_Executa $1 }
;

pentru_executa:
 | PENTRU VARSIR IN set EXECUTA program TERMINA 			{ PentruFiecare ($2, $4, $6) }
 | PENTRU proces_boolean EXECUTA program TERMINA 			{ PentruBoolean ($2, $4) }
;

daca_atunci_altfel:
 | DACA proces_boolean ATUNCI program OPRESTE    	     		{ Daca ($2, $4) }                           
 | DACA proces_boolean ATUNCI program ALTFEL program OPRESTE 	{ DacaAltfel ($2, $4, $6) } 	   
;

proces:
 | operatie 						{ Operatie $1 }
 | declarare						{ Declarare $1 }
 | afisare							{ Afiseaza $1 }
 | mutare							{ Muta $1 }
;

operatie:
 | seteaza_proces						{ ProcesSeturi $1 }
 | proces_intreg						{ ProcesIntreg $1 }
 | proces_sir							{ ProcesSir $1 }
 | proces_boolean 						{ ProcesBoolean $1 }
;

proces_intreg:
 | PARANTEZA_STANGA proces_intreg PARANTEZA_DREAPTA 		{ $2 }
 | intreg_sau_variabilaIntreg 					    		{ IntregVariabilaIntreg $1 }
 | proces_intreg PLUS proces_intreg 	    				{ Plus ($1, $3) }
 | proces_intreg MINUS proces_intreg 	    				{ Minus ($1, $3) }
 | proces_intreg INMULTIT proces_intreg       				{ Inmultire ($1, $3) }
 | proces_intreg IMPARTIT proces_intreg     				{ Impartire ($1, $3) }
 | proces_intreg REST proces_intreg  	    				{ Rest ($1, $3) }
 | MINUS proces_intreg %prec UMINUS    						{ Uminus $2 } 
;

intreg_sau_variabilaIntreg:
 | INT								{ Intreg $1 }
 | VARINT							{ VariabilaIntreg $1 } 
;

proces_sir:
 | sir_sau_variabilaSir 					    	{ SirVariabilaSir $1 }	
 | proces_sir CONCATENARE sir_sau_variabilaSir 		{ Concatenare ($1, $3) }
;

sir_sau_variabilaSir:
 | SIR 							{ Sir $1 }
 | VARSIR						{ VariabilaSir $1 } 
;

proces_boolean:
 | PARANTEZA_STANGA proces_boolean PARANTEZA_DREAPTA 		{ $2 }
 | boolean_sau_variabilaBoolean 							{ BooleanVariabilaBoolean $1 }
 | proces_intreg MAI_MIC proces_intreg 						{ Mai_mic_ca ($1, $3) }
 | proces_intreg MAI_MARE proces_intreg						{ Mai_mare_ca ($1, $3) }
 | proces_intreg MAI_MIC_EGAL proces_intreg					{ Mai_mic_sau_egal ($1, $3) }
 | proces_intreg MAI_MARE_EGAL proces_intreg				{ Mai_mare_sau_egal ($1, $3) }
 | proces_intreg EGAL proces_intreg							{ EgalIntregi ($1, $3) }
 | proces_intreg DIFERIT proces_intreg						{ DiferitIntregi ($1, $3) }
 | proces_sir EGAL proces_sir 								{ EgalSiruri ($1, $3) }
 | proces_sir DIFERIT proces_sir 							{ DiferitSiruri ($1, $3) }
 | proces_boolean EGAL proces_boolean 						{ EgalBoolean ($1, $3) }
 | proces_boolean DIFERIT proces_boolean 					{ DiferitBoolean ($1, $3) }
 | proces_boolean SI proces_boolean 						{ Si ($1, $3) }
 | proces_boolean SAU proces_boolean 						{ Sau ($1, $3) }
 | NU proces_boolean 										{ Nu $2 }
;

boolean_sau_variabilaBoolean :
 | ADEVARAT								{ Boolean $1 }
 | FALS									{ Boolean $1 }
 | VARBOOL 								{ VariabilaBoolean $1 } 
;

seteaza_proces:
 | set 											{ Set $1 }
 | set ADAUGA sir_sau_variabilaSir				{ AdaugaSet ($1, $3) }
 | set ELIMINA sir_sau_variabilaSir				{ EliminaSet ($1, $3) }
;

set:
 | INPUT 							{ $1 }
 | VARSET 							{ $1 } 
;

declarare:
 | LASA VARSET 										{ Variabile_Set $2 }
 | LASA VARINT 										{ Variabile_Intreg ($2, IntregVariabilaIntreg (Intreg 0)) }
 | LASA VARINT ATRIBUIRE proces_intreg 				{ Variabile_Intreg($2, $4) }
 | LASA VARSIR  									{ Variabile_Sir ($2, SirVariabilaSir (Sir "")) }
 | LASA VARSIR ATRIBUIRE proces_sir 				{ Variabile_Sir ($2, $4) }
 | LASA VARBOOL 									{ Variabile_Boolean ($2,  BooleanVariabilaBoolean (Boolean false)) }
 | LASA VARBOOL ATRIBUIRE proces_boolean 			{ Variabile_Boolean ($2, $4) } 
;

mutare:
| VARSET ATRIBUIRE seteaza_proces					{MutareSet ($1, $3) }
| VARINT ATRIBUIRE proces_intreg					{MutareIntreg ($1, $3) }
| VARSIR ATRIBUIRE proces_sir						{MutareSir ($1, $3) }
| VARBOOL ATRIBUIRE proces_boolean					{MutareBoolean ($1, $3) }

afisare:
 | AFISEAZA operatie 				{ Afisare $2 }
;

