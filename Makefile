all: lib commiter


lib:
	ocamlbuild -I src assistent.cma

commiter:
	ocamlbuild -I src commiter.native

clean:
	rm -rf _build
	rm -rf *.byte
	rm -rf *.native

repl: lib
	ledit ocaml -I _build/src assistent.cma
