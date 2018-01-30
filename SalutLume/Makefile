OUTPUT_NAME = mysplinterpreter

all: main

main: lexer.cmo parser.cmo exe.cmo Path.cmo
	ocamlc -o $(OUTPUT_NAME) str.cma lexer.cmo parser.cmo exe.cmo Path.cmo

lexer.cmo: lexer.ml parser.ml Path.cmo
	ocamlc -c lexer.ml

parser.cmo: parser.ml Path.cmo
	ocamlc -c parser.ml

exe.cmo: exe.ml Path.cmo
	ocamlc -w -10 -c exe.ml

lexer.ml: Path.cmo
	ocamllex lexer.mll

parser.ml: parser.mli Path.cmo
	ocamlc -c parser.mli

parser.mli: Path.cmo
	ocamlyacc parser.mly

Path.cmo: Path.ml
	ocamlc -c Path.ml
clean:
	rm -f lexer.cmo
	rm -f parser.cmo
	rm -f exe.cmo
	rm -f parser.mli
	rm -f parser.ml
	rm -f lexer.ml
	rm -f *.cmi
	rm -f Path.cmo