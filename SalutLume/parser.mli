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

val baza :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Path.baza
