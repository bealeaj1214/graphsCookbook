all::

TEXBIN=/usr/texbin/
PDFLATEX:=${TEXBIN}/xelatex
# with tikz externalize
#PDFLATEX:=${TEXBIN}/xelatex -8bit -shell-escape

PATH:=${TEXBIN}:${PATH}
export PATH

TEXINPUTS:=.:tex:build:

export TEXINPUTS
export PDFLATEX

%.pdf :: %.tex
	texi2dvi -b -p --tidy --build-dir=build $<



chapter09.tex :: chapter09.Rnw recipe01.R recipe02?.R
	Rscript assignment.cmd $<



all:: chapter09.pdf
