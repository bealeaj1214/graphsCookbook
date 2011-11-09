all::

TEXBIN=/usr/texbin
PDFLATEX:=${TEXBIN}/xelatex

PATH:=${TEXBIN}:${PATH}
export PATH

TEXINPUTS:=.:tex:build:

export TEXINPUTS
export PDFLATEX

%.pdf :: %.tex
	texi2dvi -b -p --tidy --build-dir=build $<


chapter1.pdf :: chapter1.tex build/*.tex


chapter1.tex  :: chapter1.R recipe1?.R recipe2?.R recipe3?.R recipe4?.R recipe7?.R
	Rscript $< && touch chapter1.tex

all:: chapter1.pdf
