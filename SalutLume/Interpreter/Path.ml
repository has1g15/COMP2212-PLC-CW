type variabilaIntreg =
| Intreg of int
| VariabilaIntreg of string 
;;

type variabilaSir =
| Sir of string 
| VariabilaSir of string 
;;

type variabilaBoolean =
| Boolean of bool
| VariabilaBoolean of string 
;;

type procesIntreg =
| IntregVariabilaIntreg of variabilaIntreg
| Plus of procesIntreg * procesIntreg 
| Minus of procesIntreg * procesIntreg 
| Inmultire of procesIntreg * procesIntreg 
| Impartire of procesIntreg * procesIntreg 
| Rest of procesIntreg * procesIntreg 
| Uminus of procesIntreg
;;

type procesSir =
| SirVariabilaSir of variabilaSir
| Concatenare of procesSir * variabilaSir
;;

type procesBoolean =
| BooleanVariabilaBoolean of variabilaBoolean
| Mai_mic_ca of procesIntreg * procesIntreg
| Mai_mare_ca of procesIntreg * procesIntreg
| Mai_mic_sau_egal of procesIntreg * procesIntreg
| Mai_mare_sau_egal of procesIntreg * procesIntreg
| EgalIntregi of procesIntreg * procesIntreg
| DiferitIntregi of procesIntreg * procesIntreg
| EgalSiruri of procesSir * procesSir
| DiferitSiruri of procesSir * procesSir
| EgalBoolean of procesBoolean * procesBoolean
| DiferitBoolean of procesBoolean * procesBoolean
| Si of procesBoolean * procesBoolean
| Sau of procesBoolean * procesBoolean
| Nu of procesBoolean 
;;

type seteazaProces =
| Set of string
| AdaugaSet of string * variabilaSir
| EliminaSet of string * variabilaSir 
;;

type declarare =
| Variabile_Intreg of string * procesIntreg
| Variabile_Sir of string * procesSir
| Variabile_Boolean of string * procesBoolean
| Variabile_Set of string 
;;

type operatie =
| ProcesSeturi of seteazaProces
| ProcesIntreg of procesIntreg
| ProcesSir of procesSir
| ProcesBoolean of procesBoolean
;;

type afisareOp =
| Afisare of operatie 
;;

type mutareAct = 
|MutareSet of string * seteazaProces
|MutareIntreg of string * procesIntreg
|MutareSir of string * procesSir
|MutareBoolean of string * procesBoolean
;;

type proces =
| Operatie of operatie
| Declarare of declarare
| Muta of mutareAct 
| Afiseaza of afisareOp
;;

type program =
| Afirmatie of afirmatie 
| Program_de_afirmatii of afirmatie * program
and
afirmatie = 
| Afirmatie_Daca of dacaAtunciAltfel
| Afirmatie_Pentru of pentruExecuta
| Afirmatie_Executa of proces
and 
dacaAtunciAltfel =
| Daca of procesBoolean * program 
| DacaAltfel of procesBoolean * program * program
and 
pentruExecuta = 
| PentruBoolean of procesBoolean * program
| PentruFiecare of string * string * program
;;

type baza =
| Program of program
;;