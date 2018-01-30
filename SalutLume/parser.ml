type token =
  | INT of (int)
  | VARINT of (string)
  | VARBOOL of (string)
  | VARSIR of (string)
  | VARSET of (string)
  | SIR of (string)
  | INPUT of (string)
  | CONTORIZARE of (string)
  | ADEVARAT of (bool)
  | FALS of (bool)
  | INCEPUT
  | SFARSIT
  | PLUS
  | MINUS
  | INMULTIT
  | IMPARTIT
  | REST
  | MAI_MIC
  | MAI_MARE
  | MAI_MIC_EGAL
  | MAI_MARE_EGAL
  | EGAL
  | DIFERIT
  | NU
  | SAU
  | SI
  | SEMNUL_EXCLAMARII
  | PARANTEZA_STANGA
  | PARANTEZA_DREAPTA
  | ATRIBUIRE
  | PUTERE
  | CONCATENARE
  | ADAUGA
  | ELIMINA
  | DACA
  | ATUNCI
  | ALTFEL
  | OPRESTE
  | PENTRU
  | IN
  | EXECUTA
  | TERMINA
  | AFISEAZA
  | LASA

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"

		open Path;;
# 53 "parser.ml"
let yytransl_const = [|
  267 (* INCEPUT *);
  268 (* SFARSIT *);
  269 (* PLUS *);
  270 (* MINUS *);
  271 (* INMULTIT *);
  272 (* IMPARTIT *);
  273 (* REST *);
  274 (* MAI_MIC *);
  275 (* MAI_MARE *);
  276 (* MAI_MIC_EGAL *);
  277 (* MAI_MARE_EGAL *);
  278 (* EGAL *);
  279 (* DIFERIT *);
  280 (* NU *);
  281 (* SAU *);
  282 (* SI *);
  283 (* SEMNUL_EXCLAMARII *);
  284 (* PARANTEZA_STANGA *);
  285 (* PARANTEZA_DREAPTA *);
  286 (* ATRIBUIRE *);
  287 (* PUTERE *);
  288 (* CONCATENARE *);
  289 (* ADAUGA *);
  290 (* ELIMINA *);
  291 (* DACA *);
  292 (* ATUNCI *);
  293 (* ALTFEL *);
  294 (* OPRESTE *);
  295 (* PENTRU *);
  296 (* IN *);
  297 (* EXECUTA *);
  298 (* TERMINA *);
  299 (* AFISEAZA *);
  300 (* LASA *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* VARINT *);
  259 (* VARBOOL *);
  260 (* VARSIR *);
  261 (* VARSET *);
  262 (* SIR *);
  263 (* INPUT *);
  264 (* CONTORIZARE *);
  265 (* ADEVARAT *);
  266 (* FALS *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\003\000\003\000\004\000\004\000\
\005\000\005\000\006\000\006\000\006\000\006\000\007\000\007\000\
\007\000\007\000\008\000\008\000\008\000\008\000\008\000\008\000\
\008\000\008\000\009\000\009\000\010\000\010\000\011\000\011\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\013\000\
\013\000\013\000\014\000\014\000\014\000\017\000\017\000\015\000\
\015\000\015\000\015\000\015\000\015\000\015\000\018\000\018\000\
\018\000\018\000\016\000\000\000"

let yylen = "\002\000\
\003\000\001\000\002\000\001\000\001\000\002\000\007\000\005\000\
\005\000\007\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\003\000\001\000\003\000\003\000\003\000\003\000\
\003\000\002\000\001\000\001\000\001\000\003\000\001\000\001\000\
\003\000\001\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\002\000\001\000\
\001\000\001\000\001\000\003\000\003\000\001\000\001\000\002\000\
\002\000\004\000\002\000\004\000\002\000\004\000\003\000\003\000\
\003\000\003\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\068\000\027\000\000\000\000\000\000\000\
\000\000\031\000\054\000\048\000\049\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\004\000\005\000\
\000\000\011\000\000\000\020\000\000\000\029\000\000\000\034\000\
\015\000\012\000\013\000\000\000\014\000\000\000\000\000\000\000\
\000\000\028\000\000\000\026\000\050\000\032\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\055\000\067\000\
\000\000\000\000\000\000\056\000\001\000\003\000\006\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\063\000\000\000\
\019\000\033\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\025\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\030\000\000\000\000\000\
\000\000\000\000\052\000\053\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\009\000\000\000\008\000\000\000\000\000\
\010\000\007\000"

let yydgoto = "\002\000\
\004\000\021\000\022\000\023\000\024\000\025\000\026\000\047\000\
\028\000\048\000\030\000\031\000\032\000\033\000\034\000\035\000\
\036\000\037\000"

let yysindex = "\006\000\
\247\254\000\000\126\255\000\000\000\000\238\254\003\255\012\255\
\026\255\000\000\000\000\000\000\000\000\004\255\031\000\031\000\
\031\000\047\000\015\000\002\000\009\255\126\255\000\000\000\000\
\048\255\000\000\183\000\000\000\073\255\000\000\214\255\000\000\
\000\000\000\000\000\000\079\255\000\000\004\255\031\000\024\255\
\080\255\000\000\004\255\000\000\000\000\000\000\183\000\073\255\
\214\255\030\255\092\255\074\000\038\255\032\255\000\000\000\000\
\051\255\059\255\089\255\000\000\000\000\000\000\000\000\004\255\
\004\255\004\255\004\255\004\255\004\255\004\255\004\255\004\255\
\004\255\004\255\024\255\024\255\024\255\031\000\031\000\031\000\
\031\000\024\255\024\255\199\255\214\255\071\255\000\000\094\255\
\000\000\000\000\126\255\080\255\126\255\004\255\031\000\024\255\
\147\255\147\255\108\255\108\255\000\000\199\255\199\255\199\255\
\199\255\199\255\199\255\071\255\071\255\000\000\123\255\123\255\
\123\255\111\255\000\000\000\000\121\255\093\255\102\255\199\255\
\214\255\071\255\126\255\000\000\126\255\000\000\113\255\140\255\
\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\168\000\166\255\002\255\
\133\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\245\254\000\000\000\000\
\000\000\000\000\128\255\000\000\141\255\000\000\148\255\000\000\
\000\000\000\000\000\000\159\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\237\254\000\000\000\000\000\000\124\255\000\000\000\000\000\000\
\163\255\179\255\183\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\190\255\194\255\195\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\206\255\230\255\158\255\182\255\000\000\057\255\116\255\040\000\
\057\000\065\000\082\000\090\000\107\000\000\000\123\000\131\000\
\139\000\115\000\000\000\000\000\000\000\000\000\000\000\203\255\
\207\255\211\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\237\255\000\000\000\000\000\000\000\000\134\000\253\255\
\000\000\001\000\188\255\021\000\000\000\200\000\000\000\000\000\
\153\000\000\000"

let yytablesize = 462
let yytable = "\027\000\
\002\000\003\000\062\000\029\000\005\000\042\000\001\000\047\000\
\110\000\047\000\044\000\038\000\050\000\115\000\116\000\027\000\
\047\000\014\000\027\000\029\000\061\000\047\000\029\000\032\000\
\032\000\002\000\002\000\046\000\032\000\010\000\002\000\043\000\
\039\000\032\000\084\000\049\000\051\000\052\000\054\000\088\000\
\086\000\040\000\064\000\065\000\066\000\067\000\068\000\069\000\
\070\000\071\000\072\000\073\000\074\000\078\000\079\000\041\000\
\080\000\081\000\089\000\085\000\097\000\098\000\099\000\100\000\
\101\000\102\000\103\000\104\000\105\000\106\000\107\000\117\000\
\093\000\119\000\063\000\108\000\109\000\092\000\035\000\035\000\
\094\000\035\000\035\000\035\000\055\000\035\000\011\000\027\000\
\095\000\027\000\120\000\029\000\035\000\029\000\075\000\076\000\
\122\000\035\000\111\000\112\000\113\000\114\000\077\000\127\000\
\077\000\128\000\064\000\065\000\066\000\067\000\068\000\082\000\
\083\000\078\000\079\000\121\000\080\000\081\000\096\000\027\000\
\090\000\027\000\089\000\029\000\068\000\029\000\005\000\006\000\
\007\000\008\000\009\000\010\000\011\000\125\000\012\000\013\000\
\081\000\036\000\036\000\014\000\036\000\036\000\036\000\126\000\
\036\000\032\000\032\000\080\000\081\000\015\000\129\000\036\000\
\056\000\016\000\016\000\032\000\036\000\123\000\124\000\055\000\
\017\000\066\000\067\000\068\000\018\000\055\000\055\000\017\000\
\019\000\020\000\023\000\023\000\023\000\023\000\018\000\023\000\
\023\000\023\000\023\000\023\000\023\000\130\000\023\000\023\000\
\023\000\051\000\023\000\050\000\050\000\057\000\050\000\050\000\
\050\000\023\000\024\000\024\000\024\000\024\000\023\000\024\000\
\024\000\024\000\024\000\024\000\024\000\061\000\024\000\024\000\
\024\000\059\000\024\000\064\000\065\000\066\000\067\000\068\000\
\064\000\024\000\021\000\021\000\066\000\065\000\024\000\021\000\
\021\000\021\000\021\000\021\000\021\000\058\000\021\000\021\000\
\021\000\062\000\021\000\078\000\079\000\060\000\080\000\081\000\
\087\000\021\000\022\000\022\000\118\000\000\000\021\000\022\000\
\022\000\022\000\022\000\022\000\022\000\000\000\022\000\022\000\
\022\000\000\000\022\000\057\000\058\000\059\000\060\000\000\000\
\000\000\022\000\000\000\000\000\000\000\000\000\022\000\005\000\
\042\000\045\000\046\000\055\000\010\000\011\000\000\000\012\000\
\013\000\000\000\000\000\000\000\014\000\000\000\000\000\005\000\
\042\000\045\000\046\000\000\000\010\000\000\000\015\000\012\000\
\013\000\000\000\016\000\000\000\014\000\000\000\000\000\005\000\
\042\000\045\000\053\000\000\000\010\000\000\000\015\000\012\000\
\013\000\000\000\016\000\000\000\014\000\037\000\037\000\000\000\
\037\000\037\000\037\000\000\000\037\000\000\000\015\000\000\000\
\000\000\000\000\016\000\037\000\000\000\000\000\038\000\038\000\
\037\000\038\000\038\000\038\000\000\000\038\000\039\000\039\000\
\000\000\039\000\039\000\039\000\038\000\039\000\000\000\078\000\
\079\000\038\000\080\000\081\000\039\000\000\000\000\000\040\000\
\040\000\039\000\040\000\040\000\040\000\091\000\040\000\041\000\
\041\000\000\000\041\000\041\000\041\000\040\000\041\000\000\000\
\000\000\000\000\040\000\000\000\000\000\041\000\000\000\000\000\
\042\000\042\000\041\000\042\000\042\000\042\000\000\000\042\000\
\045\000\045\000\000\000\045\000\000\000\045\000\042\000\045\000\
\043\000\043\000\000\000\042\000\000\000\043\000\045\000\043\000\
\044\000\044\000\000\000\045\000\000\000\044\000\043\000\044\000\
\046\000\046\000\000\000\043\000\000\000\046\000\044\000\046\000\
\000\000\000\000\000\000\044\000\000\000\000\000\046\000\000\000\
\000\000\000\000\000\000\046\000\028\000\028\000\028\000\028\000\
\028\000\028\000\028\000\028\000\028\000\028\000\028\000\000\000\
\000\000\000\000\028\000\064\000\065\000\066\000\067\000\068\000\
\069\000\070\000\071\000\072\000\073\000\074\000"

let yycheck = "\003\000\
\012\001\011\001\022\000\003\000\001\001\002\001\001\000\027\001\
\077\000\029\001\014\000\030\001\016\000\082\000\083\000\019\000\
\036\001\014\001\022\000\019\000\012\001\041\001\022\000\022\001\
\023\001\037\001\038\001\004\001\027\001\006\001\042\001\028\001\
\030\001\032\001\038\000\015\000\016\000\017\000\018\000\043\000\
\040\000\030\001\013\001\014\001\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\022\001\023\001\030\001\
\025\001\026\001\029\001\039\000\064\000\065\000\066\000\067\000\
\068\000\069\000\070\000\071\000\072\000\073\000\074\000\091\000\
\041\001\093\000\027\001\075\000\076\000\040\001\022\001\023\001\
\030\001\025\001\026\001\027\001\005\001\029\001\007\001\091\000\
\030\001\093\000\094\000\091\000\036\001\093\000\022\001\023\001\
\096\000\041\001\078\000\079\000\080\000\081\000\032\001\123\000\
\032\001\125\000\013\001\014\001\015\001\016\001\017\001\033\001\
\034\001\022\001\023\001\095\000\025\001\026\001\030\001\123\000\
\029\001\125\000\029\001\123\000\017\001\125\000\001\001\002\001\
\003\001\004\001\005\001\006\001\007\001\041\001\009\001\010\001\
\026\001\022\001\023\001\014\001\025\001\026\001\027\001\042\001\
\029\001\022\001\023\001\025\001\026\001\024\001\038\001\036\001\
\019\000\028\001\027\001\032\001\041\001\037\001\038\001\027\001\
\035\001\015\001\016\001\017\001\039\001\033\001\034\001\027\001\
\043\001\044\001\013\001\014\001\015\001\016\001\027\001\018\001\
\019\001\020\001\021\001\022\001\023\001\042\001\025\001\026\001\
\027\001\027\001\029\001\022\001\023\001\027\001\025\001\026\001\
\027\001\036\001\013\001\014\001\015\001\016\001\041\001\018\001\
\019\001\020\001\021\001\022\001\023\001\027\001\025\001\026\001\
\027\001\027\001\029\001\013\001\014\001\015\001\016\001\017\001\
\027\001\036\001\013\001\014\001\027\001\027\001\041\001\018\001\
\019\001\020\001\021\001\022\001\023\001\027\001\025\001\026\001\
\027\001\027\001\029\001\022\001\023\001\027\001\025\001\026\001\
\041\000\036\001\013\001\014\001\092\000\255\255\041\001\018\001\
\019\001\020\001\021\001\022\001\023\001\255\255\025\001\026\001\
\027\001\255\255\029\001\002\001\003\001\004\001\005\001\255\255\
\255\255\036\001\255\255\255\255\255\255\255\255\041\001\001\001\
\002\001\003\001\004\001\005\001\006\001\007\001\255\255\009\001\
\010\001\255\255\255\255\255\255\014\001\255\255\255\255\001\001\
\002\001\003\001\004\001\255\255\006\001\255\255\024\001\009\001\
\010\001\255\255\028\001\255\255\014\001\255\255\255\255\001\001\
\002\001\003\001\004\001\255\255\006\001\255\255\024\001\009\001\
\010\001\255\255\028\001\255\255\014\001\022\001\023\001\255\255\
\025\001\026\001\027\001\255\255\029\001\255\255\024\001\255\255\
\255\255\255\255\028\001\036\001\255\255\255\255\022\001\023\001\
\041\001\025\001\026\001\027\001\255\255\029\001\022\001\023\001\
\255\255\025\001\026\001\027\001\036\001\029\001\255\255\022\001\
\023\001\041\001\025\001\026\001\036\001\255\255\255\255\022\001\
\023\001\041\001\025\001\026\001\027\001\036\001\029\001\022\001\
\023\001\255\255\025\001\026\001\027\001\036\001\029\001\255\255\
\255\255\255\255\041\001\255\255\255\255\036\001\255\255\255\255\
\022\001\023\001\041\001\025\001\026\001\027\001\255\255\029\001\
\022\001\023\001\255\255\025\001\255\255\027\001\036\001\029\001\
\022\001\023\001\255\255\041\001\255\255\027\001\036\001\029\001\
\022\001\023\001\255\255\041\001\255\255\027\001\036\001\029\001\
\022\001\023\001\255\255\041\001\255\255\027\001\036\001\029\001\
\255\255\255\255\255\255\041\001\255\255\255\255\036\001\255\255\
\255\255\255\255\255\255\041\001\013\001\014\001\015\001\016\001\
\017\001\018\001\019\001\020\001\021\001\022\001\023\001\255\255\
\255\255\255\255\027\001\013\001\014\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\023\001"

let yynames_const = "\
  INCEPUT\000\
  SFARSIT\000\
  PLUS\000\
  MINUS\000\
  INMULTIT\000\
  IMPARTIT\000\
  REST\000\
  MAI_MIC\000\
  MAI_MARE\000\
  MAI_MIC_EGAL\000\
  MAI_MARE_EGAL\000\
  EGAL\000\
  DIFERIT\000\
  NU\000\
  SAU\000\
  SI\000\
  SEMNUL_EXCLAMARII\000\
  PARANTEZA_STANGA\000\
  PARANTEZA_DREAPTA\000\
  ATRIBUIRE\000\
  PUTERE\000\
  CONCATENARE\000\
  ADAUGA\000\
  ELIMINA\000\
  DACA\000\
  ATUNCI\000\
  ALTFEL\000\
  OPRESTE\000\
  PENTRU\000\
  IN\000\
  EXECUTA\000\
  TERMINA\000\
  AFISEAZA\000\
  LASA\000\
  "

let yynames_block = "\
  INT\000\
  VARINT\000\
  VARBOOL\000\
  VARSIR\000\
  VARSET\000\
  SIR\000\
  INPUT\000\
  CONTORIZARE\000\
  ADEVARAT\000\
  FALS\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Path.program) in
    Obj.repr(
# 54 "parser.mly"
                                ( Program _2 )
# 371 "parser.ml"
               : Path.baza))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.afirmatie) in
    Obj.repr(
# 58 "parser.mly"
                                   ( Afirmatie _1 )
# 378 "parser.ml"
               : Path.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Path.afirmatie) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Path.program) in
    Obj.repr(
# 59 "parser.mly"
                                      ( Program_de_afirmatii (_1, _2) )
# 386 "parser.ml"
               : Path.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.pentruExecuta) in
    Obj.repr(
# 63 "parser.mly"
                                   ( Afirmatie_Pentru _1 )
# 393 "parser.ml"
               : Path.afirmatie))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.dacaAtunciAltfel) in
    Obj.repr(
# 64 "parser.mly"
                                      ( Afirmatie_Daca _1 )
# 400 "parser.ml"
               : Path.afirmatie))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Path.proces) in
    Obj.repr(
# 65 "parser.mly"
                                      ( Afirmatie_Executa _1 )
# 407 "parser.ml"
               : Path.afirmatie))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : Path.program) in
    Obj.repr(
# 69 "parser.mly"
                                                   ( PentruFiecare (_2, _4, _6) )
# 416 "parser.ml"
               : Path.pentruExecuta))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : Path.procesBoolean) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Path.program) in
    Obj.repr(
# 70 "parser.mly"
                                                    ( PentruBoolean (_2, _4) )
# 424 "parser.ml"
               : Path.pentruExecuta))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : Path.procesBoolean) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Path.program) in
    Obj.repr(
# 74 "parser.mly"
                                                         ( Daca (_2, _4) )
# 432 "parser.ml"
               : Path.dacaAtunciAltfel))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : Path.procesBoolean) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : Path.program) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : Path.program) in
    Obj.repr(
# 75 "parser.mly"
                                                              ( DacaAltfel (_2, _4, _6) )
# 441 "parser.ml"
               : Path.dacaAtunciAltfel))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.operatie) in
    Obj.repr(
# 79 "parser.mly"
                  ( Operatie _1 )
# 448 "parser.ml"
               : Path.proces))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.declarare) in
    Obj.repr(
# 80 "parser.mly"
                  ( Declarare _1 )
# 455 "parser.ml"
               : Path.proces))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.afisareOp) in
    Obj.repr(
# 81 "parser.mly"
                 ( Afiseaza _1 )
# 462 "parser.ml"
               : Path.proces))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.mutareAct) in
    Obj.repr(
# 82 "parser.mly"
                ( Muta _1 )
# 469 "parser.ml"
               : Path.proces))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.seteazaProces) in
    Obj.repr(
# 86 "parser.mly"
                       ( ProcesSeturi _1 )
# 476 "parser.ml"
               : Path.operatie))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 87 "parser.mly"
                      ( ProcesIntreg _1 )
# 483 "parser.ml"
               : Path.operatie))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.procesSir) in
    Obj.repr(
# 88 "parser.mly"
                    ( ProcesSir _1 )
# 490 "parser.ml"
               : Path.operatie))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.procesBoolean) in
    Obj.repr(
# 89 "parser.mly"
                        ( ProcesBoolean _1 )
# 497 "parser.ml"
               : Path.operatie))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Path.procesIntreg) in
    Obj.repr(
# 93 "parser.mly"
                                                      ( _2 )
# 504 "parser.ml"
               : Path.procesIntreg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.variabilaIntreg) in
    Obj.repr(
# 94 "parser.mly"
                                         ( IntregVariabilaIntreg _1 )
# 511 "parser.ml"
               : Path.procesIntreg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesIntreg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 95 "parser.mly"
                                             ( Plus (_1, _3) )
# 519 "parser.ml"
               : Path.procesIntreg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesIntreg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 96 "parser.mly"
                                              ( Minus (_1, _3) )
# 527 "parser.ml"
               : Path.procesIntreg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesIntreg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 97 "parser.mly"
                                                  ( Inmultire (_1, _3) )
# 535 "parser.ml"
               : Path.procesIntreg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesIntreg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 98 "parser.mly"
                                                ( Impartire (_1, _3) )
# 543 "parser.ml"
               : Path.procesIntreg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesIntreg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 99 "parser.mly"
                                              ( Rest (_1, _3) )
# 551 "parser.ml"
               : Path.procesIntreg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 100 "parser.mly"
                                             ( Uminus _2 )
# 558 "parser.ml"
               : Path.procesIntreg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 104 "parser.mly"
              ( Intreg _1 )
# 565 "parser.ml"
               : Path.variabilaIntreg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 105 "parser.mly"
                ( VariabilaIntreg _1 )
# 572 "parser.ml"
               : Path.variabilaIntreg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.variabilaSir) in
    Obj.repr(
# 109 "parser.mly"
                                  ( SirVariabilaSir _1 )
# 579 "parser.ml"
               : Path.procesSir))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesSir) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.variabilaSir) in
    Obj.repr(
# 110 "parser.mly"
                                                 ( Concatenare (_1, _3) )
# 587 "parser.ml"
               : Path.procesSir))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 114 "parser.mly"
              ( Sir _1 )
# 594 "parser.ml"
               : Path.variabilaSir))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 115 "parser.mly"
               ( VariabilaSir _1 )
# 601 "parser.ml"
               : Path.variabilaSir))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Path.procesBoolean) in
    Obj.repr(
# 119 "parser.mly"
                                                       ( _2 )
# 608 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Path.variabilaBoolean) in
    Obj.repr(
# 120 "parser.mly"
                                       ( BooleanVariabilaBoolean _1 )
# 615 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesIntreg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 121 "parser.mly"
                                             ( Mai_mic_ca (_1, _3) )
# 623 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesIntreg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 122 "parser.mly"
                                             ( Mai_mare_ca (_1, _3) )
# 631 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesIntreg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 123 "parser.mly"
                                                ( Mai_mic_sau_egal (_1, _3) )
# 639 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesIntreg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 124 "parser.mly"
                                                ( Mai_mare_sau_egal (_1, _3) )
# 647 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesIntreg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 125 "parser.mly"
                                          ( EgalIntregi (_1, _3) )
# 655 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesIntreg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 126 "parser.mly"
                                            ( DiferitIntregi (_1, _3) )
# 663 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesSir) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesSir) in
    Obj.repr(
# 127 "parser.mly"
                                      ( EgalSiruri (_1, _3) )
# 671 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesSir) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesSir) in
    Obj.repr(
# 128 "parser.mly"
                                        ( DiferitSiruri (_1, _3) )
# 679 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesBoolean) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesBoolean) in
    Obj.repr(
# 129 "parser.mly"
                                            ( EgalBoolean (_1, _3) )
# 687 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesBoolean) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesBoolean) in
    Obj.repr(
# 130 "parser.mly"
                                              ( DiferitBoolean (_1, _3) )
# 695 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesBoolean) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesBoolean) in
    Obj.repr(
# 131 "parser.mly"
                                          ( Si (_1, _3) )
# 703 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Path.procesBoolean) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesBoolean) in
    Obj.repr(
# 132 "parser.mly"
                                           ( Sau (_1, _3) )
# 711 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Path.procesBoolean) in
    Obj.repr(
# 133 "parser.mly"
                               ( Nu _2 )
# 718 "parser.ml"
               : Path.procesBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 137 "parser.mly"
                   ( Boolean _1 )
# 725 "parser.ml"
               : Path.variabilaBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 138 "parser.mly"
                ( Boolean _1 )
# 732 "parser.ml"
               : Path.variabilaBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 139 "parser.mly"
                   ( VariabilaBoolean _1 )
# 739 "parser.ml"
               : Path.variabilaBoolean))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 143 "parser.mly"
                  ( Set _1 )
# 746 "parser.ml"
               : Path.seteazaProces))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.variabilaSir) in
    Obj.repr(
# 144 "parser.mly"
                                      ( AdaugaSet (_1, _3) )
# 754 "parser.ml"
               : Path.seteazaProces))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.variabilaSir) in
    Obj.repr(
# 145 "parser.mly"
                                       ( EliminaSet (_1, _3) )
# 762 "parser.ml"
               : Path.seteazaProces))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 149 "parser.mly"
                ( _1 )
# 769 "parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 150 "parser.mly"
                 ( _1 )
# 776 "parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 154 "parser.mly"
                         ( Variabile_Set _2 )
# 783 "parser.ml"
               : Path.declarare))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 155 "parser.mly"
                         ( Variabile_Intreg (_2, IntregVariabilaIntreg (Intreg 0)) )
# 790 "parser.ml"
               : Path.declarare))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 156 "parser.mly"
                                           ( Variabile_Intreg(_2, _4) )
# 798 "parser.ml"
               : Path.declarare))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 157 "parser.mly"
                         ( Variabile_Sir (_2, SirVariabilaSir (Sir "")) )
# 805 "parser.ml"
               : Path.declarare))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Path.procesSir) in
    Obj.repr(
# 158 "parser.mly"
                                        ( Variabile_Sir (_2, _4) )
# 813 "parser.ml"
               : Path.declarare))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 159 "parser.mly"
                         ( Variabile_Boolean (_2,  BooleanVariabilaBoolean (Boolean false)) )
# 820 "parser.ml"
               : Path.declarare))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Path.procesBoolean) in
    Obj.repr(
# 160 "parser.mly"
                                            ( Variabile_Boolean (_2, _4) )
# 828 "parser.ml"
               : Path.declarare))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.seteazaProces) in
    Obj.repr(
# 164 "parser.mly"
                                      (MutareSet (_1, _3) )
# 836 "parser.ml"
               : Path.mutareAct))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesIntreg) in
    Obj.repr(
# 165 "parser.mly"
                                     (MutareIntreg (_1, _3) )
# 844 "parser.ml"
               : Path.mutareAct))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesSir) in
    Obj.repr(
# 166 "parser.mly"
                                   (MutareSir (_1, _3) )
# 852 "parser.ml"
               : Path.mutareAct))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Path.procesBoolean) in
    Obj.repr(
# 167 "parser.mly"
                                       (MutareBoolean (_1, _3) )
# 860 "parser.ml"
               : Path.mutareAct))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Path.operatie) in
    Obj.repr(
# 170 "parser.mly"
                         ( Afisare _2 )
# 867 "parser.ml"
               : Path.afisareOp))
(* Entry baza *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let baza (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Path.baza)
