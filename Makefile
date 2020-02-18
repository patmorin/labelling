name=labelling
ipefigs=$(wildcard figs/*.ipe)

all: $(name).pdf

$(name).pdf : figs $(name).tex $(name).bib $(ipefigs)
	latexmk -pdf $(name).tex

figs: $(ipefigs)
	make -C figs


clean :
	rm -f $(name).pdf figs/*.pdf

reset: clean all
