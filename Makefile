all: commiter

commiter:
	ocamlbuild -I src commiter.native

clean:
	rm -rf _build
	rm -rf *.byte
	rm -rf *.native
