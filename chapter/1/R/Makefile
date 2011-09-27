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


all:: chapter1.pdf