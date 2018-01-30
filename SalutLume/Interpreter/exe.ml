open Path;;
open List;;
open Lexer;;

module VariableBinding = Map.Make(String);;

let alaturareIntregi = ref VariableBinding.empty;;		(* binding integers *)
let alaturareSiruri = ref VariableBinding.empty;;		(* binding strings *)
let alaturareBoolean = ref VariableBinding.empty;;		(* binding booleans *)

let alaturareSeturi = ref VariableBinding.empty;;		(* binding sets *)

let contorizatorInput = ref 0;;							(* output counter *)

let obtine_cuvinte intrare = 							(* get words *)
  let elimina_componente = Str.global_replace (Str.regexp "[ '{' | '}' | ' ']") "" in
    Str.split_delim (Str.regexp ",") (elimina_componente intrare);;

let unic lista =										(* uniqueness *)
  let set_unic = Hashtbl.create (List.length lista) in
  List.iter (fun x -> Hashtbl.replace set_unic x ()) lista;
  Hashtbl.fold (fun x () xs -> x :: xs) set_unic []
;;

let sortare_lista_siruri l =							(* sort strings *)
  List.sort compare (unic l)
;;

let obtine_cuvinte_unice intrare =						(* unique words *)
  sortare_lista_siruri (obtine_cuvinte intrare)
;;

let verifica_variabile_sir var = match var with			(* find string *)
  | Sir s -> s
  | VariabilaSir vs -> try
        VariableBinding.find vs !alaturareSiruri
      with Not_found -> failwith (""^vs^" Need to declare as type sir")
;;

let verifica_variabile_intreg var = match var with		(* find int *)
  | Intreg i -> i 
  | VariabilaIntreg vi -> try
        VariableBinding.find vi !alaturareIntregi
      with Not_found -> failwith (""^vi^" Need to declare as type intreg")
;;

let verifica_variabile_boolean var = match var with		(* find boolean *)
  | Boolean b -> b
  | VariabilaBoolean vb -> try
        VariableBinding.find vb !alaturareBoolean
      with Not_found -> failwith (""^vb^" Need to declare as type boolean")
;;

let verifica_variabile_set se =							(* find set *)
  VariableBinding.find se !alaturareSeturi
;;

let rec schimba_intrarile_goale = function				(* deals with empty input *)
| [] -> []
| (h::t) when h = ":" -> ""::(schimba_intrarile_goale t) 
| (h::t) ->  h::(schimba_intrarile_goale t)
;;

let proceseaza_intrari input_line stream_number= 		(* deals with input *)
  alaturareSeturi := VariableBinding.add ("$intrare"^(string_of_int !stream_number)) (schimba_intrarile_goale (obtine_cuvinte_unice input_line)) !alaturareSeturi
;;

let proceseaza_seturi var  = match var with				(* deals with sets *)
  | Set s -> verifica_variabile_set s
  | AdaugaSet (se, vs) -> (let valoare_sir = verifica_variabile_sir vs in		(* value of string *)
                          try
                              let set = verifica_variabile_set se in valoare_sir :: set;
                          with Not_found -> failwith (""^se^" Not Found"))
  | EliminaSet (se, vs) -> (let valoare_sir = verifica_variabile_sir vs in
                          try
                              let set = verifica_variabile_set se in
                                List.filter (fun x-> if (compare valoare_sir x)==0 then false else true) set
                          with Not_found -> failwith (""^se^" Not Found"))
;;

let exista se =											(* find occurrence of variable *)
  try
    VariableBinding.find se !alaturareIntregi;
    None
  with Not_found -> try 
    VariableBinding.find se !alaturareSiruri; 
    None
  with Not_found -> 
    VariableBinding.find se !alaturareBoolean;
    None
;;

let proceseaza se = 									(* deals with variables *)
  try
    exista se          
  with Not_found ->  failwith (""^se^ " - not declared.")
;;

let rec proceseaza_intregi var = match var with			(* deals with integers *)
  | IntregVariabilaIntreg iv -> verifica_variabile_intreg iv
  | Plus (v1, v2) -> (proceseaza_intregi v1) + (proceseaza_intregi v2)
  | Minus (v1, v2) -> (proceseaza_intregi v1) - (proceseaza_intregi v2)
  | Inmultire (v1, v2) -> (proceseaza_intregi v1) * (proceseaza_intregi v2)
  | Impartire (v1, v2) ->( try
                          (proceseaza_intregi v1) / (proceseaza_intregi v2)
                        with Division_by_zero -> failwith "Not divisible by zero")
  | Rest (v1, v2) -> (proceseaza_intregi v1) mod (proceseaza_intregi v2)
  | Uminus v1 -> -(proceseaza_intregi v1)
;;

let rec proceseaza_sir var = match var with				(* deals with strings *)
  | SirVariabilaSir svs -> verifica_variabile_sir svs
  | Concatenare (s1, s2) -> (proceseaza_sir s1) ^ (verifica_variabile_sir s2)
;;

let rec proceseaza_bool var = match var with			(* deals with booleans *)
  | BooleanVariabilaBoolean bvb -> verifica_variabile_boolean bvb
  | Mai_mic_ca (ia1, ia2) -> (proceseaza_intregi ia1) < (proceseaza_intregi ia2)
  | Mai_mare_ca (ia1, ia2) -> (proceseaza_intregi ia1) > (proceseaza_intregi ia2)
  | Mai_mic_sau_egal (ia1, ia2) -> (proceseaza_intregi ia1) <= (proceseaza_intregi ia2)
  | Mai_mare_sau_egal (ia1, ia2) -> (proceseaza_intregi ia1) >= (proceseaza_intregi ia2)
  | EgalIntregi (ia1, ia2) -> (proceseaza_intregi ia1) == (proceseaza_intregi ia2)
  | DiferitIntregi (ia1, ia2) -> (proceseaza_intregi ia1) != (proceseaza_intregi ia2)
  | EgalSiruri (sa1, sa2) -> let valoare = String.compare (proceseaza_sir sa1) (proceseaza_sir sa2) in valoare == 0
  | DiferitSiruri (sa1, sa2) -> let valoare = String.compare (proceseaza_sir sa1) (proceseaza_sir sa2) in valoare != 0
  | EgalBoolean (ba1, ba2) -> (proceseaza_bool ba1) == (proceseaza_bool ba2)
  | DiferitBoolean (ba1, ba2) -> (proceseaza_bool ba1) == (proceseaza_bool ba2)
  | Si (ba1, ba2) -> (proceseaza_bool ba1) && (proceseaza_bool ba2)
  | Sau (ba1, ba2) -> (proceseaza_bool ba1) || (proceseaza_bool ba2)
  | Nu ba -> not (proceseaza_bool ba)
;;

let rec proceseaza_declarare var = match var with		(* deals with declaration *)
  | Variabile_Set s -> alaturareSeturi := VariableBinding.add s [] !alaturareSeturi
  | Variabile_Intreg (s, ia) -> alaturareIntregi := VariableBinding.add s (proceseaza_intregi ia) !alaturareIntregi
  | Variabile_Sir (s, sa) -> alaturareSiruri := VariableBinding.add s (proceseaza_sir sa) !alaturareSiruri
  | Variabile_Boolean (s, ba) -> alaturareBoolean := VariableBinding.add s (proceseaza_bool ba) !alaturareBoolean
;;

let rec goleste_coloana = function						(* deals with empty *)
  | [] -> []
  | (h::t) when h = "" -> ":"::(goleste_coloana t) 
  | (h::t) ->  h::(goleste_coloana t)
;;

let fata x = match x with 								(* find front of list *)
  | (s, t) -> s;;

let desparte list n =									(* list division *)
  let rec auxiliar i acc = function
      | [] -> List.rev acc, []
      | h :: t as l -> if i = 0 then List.rev acc, l
                       else auxiliar (i-1) (h :: acc) t  
                       in auxiliar n [] list;;

let format_set o =										
  let trunchiaza = (fata (desparte o !contorizatorInput)) in	
  let rec formatSetAuxiliar o = match o with 
  | [] -> ""
  | [x] -> x
  | head::body -> head^", "^(formatSetAuxiliar body)
                  in "{"^(formatSetAuxiliar trunchiaza)^"}";;

let rec proceseaza_afisare var = match var with		(* deals with printing *)
  | Afisare (ProcesSeturi s) -> (try 
                              let set = (proceseaza_seturi s) in 
                                print_newline (print_string (format_set (goleste_coloana (sortare_lista_siruri set))))
                            with Not_found -> failwith ("Cannot find set"))
  | Afisare (ProcesIntreg i) -> print_newline (print_int (proceseaza_intregi i))
  | Afisare (ProcesBoolean b) -> (let rezultat = (proceseaza_bool b) in
                                  if (rezultat == true) then print_newline (print_string "true") 
                                  else print_newline (print_string "false"))
  | Afisare (ProcesSir s) -> print_newline (print_string (proceseaza_sir s))
;;

let proceseaza_mutare var = match var with			(* deals with mutations *)
   | MutareSet (setName, sa) -> (let set_nou = proceseaza_seturi sa in
   								  alaturareSeturi := VariableBinding.add setName set_nou !alaturareSeturi)
   | MutareIntreg (intName, ia) -> (let intreg_nou = proceseaza_intregi ia in
   									alaturareIntregi := VariableBinding.add intName intreg_nou !alaturareIntregi)
   | MutareSir (strName, sa) -> (let sir_nou = proceseaza_sir sa in
   									alaturareSiruri := VariableBinding.add strName sir_nou !alaturareSiruri)
   | MutareBoolean (blName, ba) -> (let boolean_nou = proceseaza_bool ba in
   									alaturareBoolean := VariableBinding.add blName boolean_nou !alaturareBoolean)
;;

let operatie var = match var with					(* deals with operations *)
  | ProcesSeturi sa -> proceseaza_seturi sa; ()
  | ProcesIntreg ia -> proceseaza_intregi ia; ()
  | ProcesSir sa -> proceseaza_sir sa; ()
  | ProcesBoolean ba -> proceseaza_bool ba; ()
;;

let proceseaza_actiune var = match var with			(* deals with collection of processes *)
  | Operatie op -> operatie op
  | Declarare s -> proceseaza_declarare s
  | Muta s -> proceseaza_mutare s
  | Afiseaza s -> proceseaza_afisare s
;;

let rec proceseaza_baza var = match var with		
  | Program any -> proceseaza_program any

and proceseaza_program var = match var with
  | Afirmatie s -> proceseaza_afirmatie s
  | Program_de_afirmatii (s, b) -> proceseaza_afirmatie s; proceseaza_program b

and proceseaza_afirmatie var = match var with	(* deals with statements *)
  | Afirmatie_Daca s -> proceseaza_daca s
  | Afirmatie_Pentru s -> proceseaza_pentru s
  | Afirmatie_Executa s -> proceseaza_actiune s

and proceseaza_daca var = match var with		(* deals with if statements *)
  | Daca (b, bod) -> if (proceseaza_bool b) then (proceseaza_program bod)
  | DacaAltfel (b, bod1, bod2) -> if (proceseaza_bool b) then (proceseaza_program bod1) else (proceseaza_program bod2)

and proceseaza_pentru var = match var with		(* deals with for loops *)
  | PentruFiecare (v, setName, bod) -> (try
                                exista v;
                                failwith (""^v^" used already!")
                              with Not_found -> (try
                                                   (let seturi = verifica_variabile_set setName in
                                                    let numara = List.length seturi in
                                                      proceseaza_declarare (Variabile_Sir (v, SirVariabilaSir (Sir "")));
                                                      for i = 0 to (numara - 1) do 
                                                      	proceseaza_mutare (MutareSir (v, SirVariabilaSir (Sir (List.nth seturi i))));
                                                        proceseaza_program bod;
                                                      done;
                                                      alaturareSiruri := VariableBinding.remove v !alaturareSiruri)
                                                 with Not_found -> failwith (""^setName^" Not Found")))
  | PentruBoolean (bl, bod) -> while (proceseaza_bool bl) do (proceseaza_program bod) done
;;

let stocheaza_intrari = 						(* stores input *)
  try
    let contorizator_stream = ref 0 in
      while true do
        let line = input_line stdin in
          if (Str.string_match (Str.regexp "^[0-9]+$") line 0) then 
            (
            contorizatorInput := (int_of_string line);
            alaturareIntregi := VariableBinding.add "[^]CONTORIZARE" !contorizatorInput !alaturareIntregi)
          else( 
            proceseaza_intrari line contorizator_stream;
            contorizator_stream := !contorizator_stream + 1
          )
      done;
      None
  with
      End_of_file -> None
;;

let exe =
  stocheaza_intrari;
  try
    let lexbuf = Lexing.from_channel (open_in Sys.argv.(1)) in
    let rezultat = (Parser.baza Lexer.token lexbuf) in
      proceseaza_baza rezultat
  with Lexer.Eof ->
    exit 0