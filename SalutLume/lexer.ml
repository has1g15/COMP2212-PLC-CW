# 1 "lexer.mll"
 
open Parser        
exception Eof

# 7 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base = 
   "\000\000\207\255\001\000\079\000\017\000\002\000\001\000\007\000\
    \005\000\006\000\002\000\102\000\001\000\000\000\232\255\233\255\
    \234\255\235\255\002\000\106\000\017\000\006\000\031\000\245\255\
    \246\255\247\255\007\000\192\000\110\000\009\000\027\001\002\000\
    \254\255\255\255\164\000\011\000\253\255\252\255\010\000\020\000\
    \010\000\006\000\022\000\251\255\230\255\022\000\043\000\027\000\
    \027\000\038\000\054\000\250\255\231\255\102\001\177\001\252\001\
    \071\002\146\002\221\002\040\003\115\003\190\003\061\000\056\000\
    \062\000\061\000\100\000\086\000\112\000\097\000\103\000\102\000\
    \248\255\236\255\118\000\122\000\123\000\243\255\104\000\007\000\
    \000\000\241\255\123\000\126\000\127\000\242\255\108\000\027\000\
    \014\000\240\255\125\000\122\000\131\000\121\000\239\255\121\000\
    \126\000\122\000\137\000\226\255\136\000\119\000\121\000\142\000\
    \219\255\151\000\149\000\151\000\139\000\149\000\139\000\238\255\
    \186\000\225\255\237\255\229\255\160\000\228\255\180\000\170\000\
    \199\000\221\000\201\000\203\000\218\000\226\000\227\255\227\000\
    \211\000\229\000\211\000\217\255\218\000\230\000\225\000\224\255\
    \239\000\241\000\235\000\223\255\229\000\244\000\249\000\225\000\
    \021\001\215\255\005\001\015\001\005\001\222\255\013\001\044\001\
    \047\001\045\001\221\255\049\001\056\001\061\001\083\001\097\001\
    \079\001\218\255\088\001\083\001\216\255\120\001\139\001\214\255\
    \129\001\213\255\009\004\000\000\003\000\084\004\159\004\234\004\
    \053\005";
  Lexing.lex_backtrk = 
   "\255\255\255\255\255\255\255\255\043\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\011\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\035\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\047\000\047\000\047\000\
    \047\000\047\000\047\000\047\000\047\000\006\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\044\000\255\255\255\255\255\255\045\000\255\255\
    \046\000";
  Lexing.lex_default = 
   "\255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\000\000\000\000\
    \000\000\000\000\255\255\255\255\255\255\255\255\255\255\000\000\
    \000\000\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\034\000\255\255\000\000\000\000\255\255\255\255\
    \255\255\255\255\255\255\000\000\000\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\000\000\000\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\255\255\255\255\255\255\000\000\255\255\255\255\
    \255\255\000\000\255\255\255\255\255\255\000\000\255\255\255\255\
    \255\255\000\000\255\255\255\255\255\255\255\255\000\000\255\255\
    \255\255\255\255\255\255\000\000\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\000\000\
    \255\255\000\000\000\000\000\000\255\255\000\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\000\000\255\255\
    \255\255\255\255\255\255\000\000\255\255\255\255\255\255\000\000\
    \255\255\255\255\255\255\000\000\255\255\255\255\255\255\255\255\
    \255\255\000\000\255\255\255\255\255\255\000\000\255\255\255\255\
    \255\255\255\255\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\255\255\255\255\000\000\255\255\255\255\000\000\
    \255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255";
  Lexing.lex_trans = 
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\033\000\032\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \033\000\018\000\030\000\114\000\027\000\014\000\082\000\080\000\
    \017\000\016\000\023\000\025\000\034\000\024\000\116\000\031\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\036\000\088\000\022\000\081\000\021\000\074\000\
    \171\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\089\000\073\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\002\000\000\000\175\000\015\000\172\000\
    \173\000\011\000\165\000\026\000\019\000\020\000\007\000\005\000\
    \162\000\029\000\155\000\150\000\006\000\039\000\013\000\010\000\
    \009\000\168\000\146\000\028\000\008\000\115\000\062\000\038\000\
    \092\000\040\000\041\000\042\000\012\000\091\000\003\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\090\000\043\000\052\000\047\000\048\000\049\000\050\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\051\000\063\000\064\000\065\000\170\000\066\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\121\000\105\000\118\000\067\000\035\000\045\000\
    \068\000\069\000\119\000\106\000\046\000\070\000\071\000\044\000\
    \072\000\076\000\120\000\078\000\077\000\079\000\084\000\086\000\
    \085\000\087\000\100\000\095\000\093\000\094\000\096\000\097\000\
    \098\000\075\000\099\000\101\000\102\000\103\000\083\000\104\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\112\000\107\000\108\000\109\000\110\000\111\000\
    \001\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\113\000\117\000\140\000\136\000\053\000\
    \255\255\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\054\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\030\000\132\000\037\000\123\000\127\000\
    \124\000\125\000\122\000\126\000\128\000\129\000\130\000\131\000\
    \133\000\134\000\135\000\030\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\137\000\138\000\139\000\
    \141\000\142\000\143\000\144\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\030\000\145\000\147\000\
    \148\000\149\000\030\000\151\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\030\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \152\000\153\000\154\000\156\000\255\255\157\000\158\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\159\000\160\000\161\000\163\000\053\000\164\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\166\000\167\000\169\000\000\000\000\000\
    \000\000\000\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\000\000\000\000\000\000\000\000\
    \053\000\000\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\055\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\000\000\
    \000\000\000\000\000\000\053\000\000\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \056\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\000\000\000\000\000\000\000\000\053\000\000\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\057\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\000\000\000\000\000\000\
    \000\000\053\000\000\000\058\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \000\000\000\000\000\000\000\000\053\000\000\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\059\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\000\000\000\000\000\000\000\000\053\000\
    \000\000\053\000\053\000\053\000\053\000\060\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\000\000\000\000\
    \000\000\000\000\053\000\000\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\000\000\000\000\000\000\000\000\053\000\000\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\000\000\000\000\000\000\000\000\
    \170\000\000\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\000\000\
    \000\000\000\000\000\000\174\000\000\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\000\000\000\000\000\000\000\000\174\000\000\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\000\000\000\000\000\000\
    \000\000\176\000\000\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \000\000\000\000\000\000\000\000\176\000\000\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\018\000\000\000\000\000\021\000\079\000\
    \000\000\000\000\000\000\000\000\031\000\000\000\012\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\035\000\087\000\000\000\080\000\000\000\022\000\
    \002\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\088\000\022\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\000\000\255\255\171\000\000\000\002\000\
    \172\000\000\000\006\000\000\000\000\000\000\000\000\000\000\000\
    \007\000\000\000\008\000\009\000\000\000\038\000\000\000\000\000\
    \000\000\005\000\010\000\000\000\000\000\013\000\026\000\029\000\
    \020\000\039\000\040\000\041\000\000\000\020\000\000\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\020\000\042\000\045\000\046\000\047\000\048\000\049\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\050\000\062\000\063\000\064\000\003\000\065\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\011\000\019\000\011\000\066\000\034\000\028\000\
    \067\000\068\000\011\000\019\000\028\000\069\000\070\000\028\000\
    \071\000\074\000\011\000\075\000\076\000\078\000\082\000\083\000\
    \084\000\086\000\090\000\091\000\092\000\093\000\095\000\096\000\
    \097\000\074\000\098\000\100\000\101\000\102\000\082\000\103\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\105\000\106\000\107\000\108\000\109\000\110\000\
    \000\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\112\000\116\000\118\000\119\000\027\000\
    \034\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\030\000\120\000\030\000\121\000\122\000\
    \123\000\124\000\121\000\125\000\127\000\128\000\129\000\130\000\
    \132\000\133\000\134\000\030\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\136\000\137\000\138\000\
    \140\000\141\000\142\000\143\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\030\000\144\000\146\000\
    \147\000\148\000\030\000\150\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\030\000\030\000\030\000\
    \030\000\030\000\030\000\030\000\030\000\030\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \151\000\152\000\153\000\155\000\034\000\156\000\157\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\158\000\159\000\160\000\162\000\053\000\163\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
    \053\000\054\000\054\000\054\000\054\000\054\000\054\000\054\000\
    \054\000\054\000\054\000\165\000\166\000\168\000\255\255\255\255\
    \255\255\255\255\054\000\054\000\054\000\054\000\054\000\054\000\
    \054\000\054\000\054\000\054\000\054\000\054\000\054\000\054\000\
    \054\000\054\000\054\000\054\000\054\000\054\000\054\000\054\000\
    \054\000\054\000\054\000\054\000\255\255\255\255\255\255\255\255\
    \054\000\255\255\054\000\054\000\054\000\054\000\054\000\054\000\
    \054\000\054\000\054\000\054\000\054\000\054\000\054\000\054\000\
    \054\000\054\000\054\000\054\000\054\000\054\000\054\000\054\000\
    \054\000\054\000\054\000\054\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\255\255\
    \255\255\255\255\255\255\055\000\255\255\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\055\000\
    \055\000\055\000\055\000\055\000\055\000\055\000\055\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\255\255\255\255\255\255\255\255\056\000\255\255\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\056\000\056\000\056\000\056\000\056\000\056\000\
    \056\000\056\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\255\255\255\255\255\255\
    \255\255\057\000\255\255\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \255\255\255\255\255\255\255\255\058\000\255\255\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \059\000\059\000\059\000\059\000\059\000\059\000\059\000\059\000\
    \059\000\059\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\059\000\059\000\059\000\059\000\059\000\059\000\059\000\
    \059\000\059\000\059\000\059\000\059\000\059\000\059\000\059\000\
    \059\000\059\000\059\000\059\000\059\000\059\000\059\000\059\000\
    \059\000\059\000\059\000\255\255\255\255\255\255\255\255\059\000\
    \255\255\059\000\059\000\059\000\059\000\059\000\059\000\059\000\
    \059\000\059\000\059\000\059\000\059\000\059\000\059\000\059\000\
    \059\000\059\000\059\000\059\000\059\000\059\000\059\000\059\000\
    \059\000\059\000\059\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\255\255\255\255\
    \255\255\255\255\060\000\255\255\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\255\255\255\255\255\255\255\255\061\000\255\255\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\255\255\255\255\255\255\255\255\
    \170\000\255\255\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\170\000\170\000\170\000\170\000\
    \170\000\170\000\170\000\170\000\173\000\173\000\173\000\173\000\
    \173\000\173\000\173\000\173\000\173\000\173\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\173\000\173\000\173\000\
    \173\000\173\000\173\000\173\000\173\000\173\000\173\000\173\000\
    \173\000\173\000\173\000\173\000\173\000\173\000\173\000\173\000\
    \173\000\173\000\173\000\173\000\173\000\173\000\173\000\255\255\
    \255\255\255\255\255\255\173\000\255\255\173\000\173\000\173\000\
    \173\000\173\000\173\000\173\000\173\000\173\000\173\000\173\000\
    \173\000\173\000\173\000\173\000\173\000\173\000\173\000\173\000\
    \173\000\173\000\173\000\173\000\173\000\173\000\173\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\255\255\255\255\255\255\255\255\174\000\255\255\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\174\000\174\000\174\000\174\000\174\000\174\000\
    \174\000\174\000\175\000\175\000\175\000\175\000\175\000\175\000\
    \175\000\175\000\175\000\175\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\175\000\175\000\175\000\175\000\175\000\
    \175\000\175\000\175\000\175\000\175\000\175\000\175\000\175\000\
    \175\000\175\000\175\000\175\000\175\000\175\000\175\000\175\000\
    \175\000\175\000\175\000\175\000\175\000\255\255\255\255\255\255\
    \255\255\175\000\255\255\175\000\175\000\175\000\175\000\175\000\
    \175\000\175\000\175\000\175\000\175\000\175\000\175\000\175\000\
    \175\000\175\000\175\000\175\000\175\000\175\000\175\000\175\000\
    \175\000\175\000\175\000\175\000\175\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \255\255\255\255\255\255\255\255\176\000\255\255\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \176\000\176\000\176\000\176\000\176\000\176\000\176\000\176\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code = 
   "";
  Lexing.lex_backtrk_code = 
   "";
  Lexing.lex_default_code = 
   "";
  Lexing.lex_trans_code = 
   "";
  Lexing.lex_check_code = 
   "";
  Lexing.lex_code = 
   "";
}

let rec token lexbuf =
    __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 8 "lexer.mll"
                               ( token lexbuf )
# 502 "lexer.ml"

  | 1 ->
# 9 "lexer.mll"
                            ( token lexbuf )
# 507 "lexer.ml"

  | 2 ->
# 10 "lexer.mll"
                                        ( token lexbuf)
# 512 "lexer.ml"

  | 3 ->
let
# 11 "lexer.mll"
                    siruri
# 518 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 11 "lexer.mll"
                                     ( SIR( List.nth (Str.split_delim (Str.regexp "\"") siruri) 1) )
# 522 "lexer.ml"

  | 4 ->
# 12 "lexer.mll"
                   ( INCEPUT )
# 527 "lexer.ml"

  | 5 ->
# 13 "lexer.mll"
                   ( SFARSIT )
# 532 "lexer.ml"

  | 6 ->
let
# 14 "lexer.mll"
                           intrare
# 538 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 14 "lexer.mll"
                                   ( INPUT intrare )
# 542 "lexer.ml"

  | 7 ->
let
# 15 "lexer.mll"
                     iesire
# 548 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_start_pos + 12) in
# 15 "lexer.mll"
                              ( CONTORIZARE iesire )
# 552 "lexer.ml"

  | 8 ->
# 16 "lexer.mll"
                      ( PLUS )
# 557 "lexer.ml"

  | 9 ->
# 17 "lexer.mll"
                      ( MINUS )
# 562 "lexer.ml"

  | 10 ->
# 18 "lexer.mll"
                      ( INMULTIT )
# 567 "lexer.ml"

  | 11 ->
# 19 "lexer.mll"
                      ( IMPARTIT )
# 572 "lexer.ml"

  | 12 ->
# 20 "lexer.mll"
                ( MAI_MIC )
# 577 "lexer.ml"

  | 13 ->
# 21 "lexer.mll"
                ( MAI_MARE )
# 582 "lexer.ml"

  | 14 ->
# 22 "lexer.mll"
                   ( MAI_MIC_EGAL )
# 587 "lexer.ml"

  | 15 ->
# 23 "lexer.mll"
                   ( MAI_MARE_EGAL )
# 592 "lexer.ml"

  | 16 ->
# 24 "lexer.mll"
                ( EGAL )
# 597 "lexer.ml"

  | 17 ->
# 25 "lexer.mll"
                   ( DIFERIT )
# 602 "lexer.ml"

  | 18 ->
# 26 "lexer.mll"
               ( SEMNUL_EXCLAMARII )
# 607 "lexer.ml"

  | 19 ->
# 27 "lexer.mll"
                ( ATRIBUIRE )
# 612 "lexer.ml"

  | 20 ->
# 28 "lexer.mll"
                      ( PARANTEZA_STANGA )
# 617 "lexer.ml"

  | 21 ->
# 29 "lexer.mll"
                      ( PARANTEZA_DREAPTA )
# 622 "lexer.ml"

  | 22 ->
# 30 "lexer.mll"
                      ( PUTERE )
# 627 "lexer.ml"

  | 23 ->
# 31 "lexer.mll"
                      ( REST )
# 632 "lexer.ml"

  | 24 ->
# 32 "lexer.mll"
                ( SAU )
# 637 "lexer.ml"

  | 25 ->
# 33 "lexer.mll"
                ( SI )
# 642 "lexer.ml"

  | 26 ->
# 34 "lexer.mll"
               ( NU )
# 647 "lexer.ml"

  | 27 ->
# 35 "lexer.mll"
                ( CONCATENARE )
# 652 "lexer.ml"

  | 28 ->
# 36 "lexer.mll"
                  ( ADAUGA )
# 657 "lexer.ml"

  | 29 ->
# 37 "lexer.mll"
                   ( ELIMINA )
# 662 "lexer.ml"

  | 30 ->
# 38 "lexer.mll"
                ( DACA )
# 667 "lexer.ml"

  | 31 ->
# 39 "lexer.mll"
                  ( ATUNCI )
# 672 "lexer.ml"

  | 32 ->
# 40 "lexer.mll"
                  ( ALTFEL )
# 677 "lexer.ml"

  | 33 ->
# 41 "lexer.mll"
                 ( OPRESTE )
# 682 "lexer.ml"

  | 34 ->
# 42 "lexer.mll"
                  ( PENTRU )
# 687 "lexer.ml"

  | 35 ->
# 43 "lexer.mll"
               ( IN )
# 692 "lexer.ml"

  | 36 ->
# 44 "lexer.mll"
                   ( EXECUTA )
# 697 "lexer.ml"

  | 37 ->
# 45 "lexer.mll"
                     ( TERMINA )
# 702 "lexer.ml"

  | 38 ->
# 46 "lexer.mll"
                   ( ADEVARAT true )
# 707 "lexer.ml"

  | 39 ->
# 47 "lexer.mll"
                ( FALS false )
# 712 "lexer.ml"

  | 40 ->
# 48 "lexer.mll"
                    ( AFISEAZA )
# 717 "lexer.ml"

  | 41 ->
# 49 "lexer.mll"
                ( LASA )
# 722 "lexer.ml"

  | 42 ->
# 50 "lexer.mll"
                ( SIR "")
# 727 "lexer.ml"

  | 43 ->
let
# 51 "lexer.mll"
                 lxm
# 733 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 51 "lexer.mll"
                              ( INT(int_of_string lxm) )
# 737 "lexer.ml"

  | 44 ->
let
# 52 "lexer.mll"
                           variabila_sir
# 743 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 52 "lexer.mll"
                                                ( VARSIR( variabila_sir ) )
# 747 "lexer.ml"

  | 45 ->
let
# 53 "lexer.mll"
                             variabila_intreg
# 753 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 53 "lexer.mll"
                                                  ( VARINT( variabila_intreg ) )
# 757 "lexer.ml"

  | 46 ->
let
# 54 "lexer.mll"
                             variabila_boolean
# 763 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 54 "lexer.mll"
                                                  ( VARBOOL( variabila_boolean ) )
# 767 "lexer.ml"

  | 47 ->
let
# 55 "lexer.mll"
                              set
# 773 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 55 "lexer.mll"
                                                 ( VARSET set )
# 777 "lexer.ml"

  | 48 ->
# 56 "lexer.mll"
                      ( raise Eof )
# 782 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;

