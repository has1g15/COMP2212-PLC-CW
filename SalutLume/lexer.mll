{
open Parser        
exception Eof
}
let toateCaracterele = ['a'-'z''A'-'Z''_''0'-'9']						(* all characters *)
let toateSirurile = ['"'](toateCaracterele*[' ']*)*['"']				(* all strings *)
rule token = parse
    | [' ' '\t']     							   { token lexbuf }     
    | ['\n' ]  		 							   { token lexbuf }
    | "/*" [^'|''*']* "*/"              { token lexbuf}
	| toateSirurile as siruri           { SIR( List.nth (Str.split_delim (Str.regexp "\"") siruri) 1) }
	| "inceput"							{ INCEPUT }						(* start of a program *)
	| "sfarsit"							{ SFARSIT } 					(* end of a program *)
	| "$intrare"['0'-'9']+ as intrare	{ INPUT intrare }				
	| "contorizator" as iesire			{ CONTORIZARE iesire }			(* counts output *)	
    | '+'      							{ PLUS }
    | '-'      							{ MINUS }
    | '*'      							{ INMULTIT }					
    | '/'      							{ IMPARTIT }
	| "< ca"							{ MAI_MIC } 
	| "> ca"							{ MAI_MARE }
	| "< sau ="							{ MAI_MIC_EGAL }
	| "> sau ="							{ MAI_MARE_EGAL }
	| "egal"							{ EGAL }						(* check equality of variables *)
	| "diferit"							{ DIFERIT }						(* check if variables are not equal *)
	| "!!"								{ SEMNUL_EXCLAMARII }			(* end of statement *)
	| "<-" 								{ ATRIBUIRE }					(* assignment *)
    | '('      							{ PARANTEZA_STANGA }
    | ')'      							{ PARANTEZA_DREAPTA }
    | '^'      							{ PUTERE }						(* power *)
    | '%'      							{ REST }						(* modulo *)
	| "sau"								{ SAU }							(* or *)
	| "si" 								{ SI }							(* and *)
	| "nu"								{ NU }							(* not *)
	| "|-|"								{ CONCATENARE }					(* concatenation *)
	| "adauga"							{ ADAUGA }						(* add sets *)
	| "elimina" 						{ ELIMINA }						(* set removal *)
	| "daca"							{ DACA }						(* if then else statements *)
	| "atunci"							{ ATUNCI }
	| "altfel"							{ ALTFEL }
	| "oprit"							{ OPRESTE }
	| "pentru"							{ PENTRU }						(* for loops *)
	| "in"								{ IN }
	| "executa"							{ EXECUTA }
	| "terminat"  						{ TERMINA }
	| "adevarat"						{ ADEVARAT true }			
	| "fals"							{ FALS false }
	| "afiseaza" 						{ AFISEAZA }					(* print statement *)
	| "lasa"							{ LASA }						(* declaration *)
	| "gol"								{ SIR ""}						(* empty string *)
	| ['0'-'9']+ as lxm 						   { INT(int_of_string lxm) }
	| '~'toateCaracterele+ as variabila_sir        { VARSIR( variabila_sir ) }			(* input of type string *)
	| "[^]"toateCaracterele+ as variabila_intreg     { VARINT( variabila_intreg ) }		(* input of type int *)
	| "[?]"toateCaracterele+ as variabila_boolean    { VARBOOL( variabila_boolean ) }	(* input of type boolean *)
    | '$'toateCaracterele+ as set              	 { VARSET set }							(* input of type set *)
    | eof      							{ raise Eof }
