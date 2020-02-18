name=labelling
ipefigs=$(wildcard figs/*.ipe)

all: $(name).pdf

$(name).pdf : figs $(name).tex $(name).bib $(ipefigs)
	latexmk -pdf $(name).tex

figs: $(ipefigs)
	make -C figs

install: $(name).pdf
	scp $(name).pdf cglab.ca:public_html/publications/drafts/$(name)/

clean :
	rm -f $(name).pdf figs/*.pdf

reset: clean all
