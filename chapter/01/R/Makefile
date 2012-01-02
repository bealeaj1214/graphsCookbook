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


chapter1.pdf :: chapter1.tex build/*.tex 


chapter1.tex  :: chapter1.R recipe1?.R recipe2?.R recipe3?.R recipe4?.R recipe7?.R
	Rscript $< && touch chapter1.tex

chapter01.tex :: chapter01.Rnw recipe7?.R recipe5?.R recipe4?.R recipe6?.R recipe11?.R legend.tex
	Rscript assignment.cmd $<


legend.tex :: legend.Rnw recipe10a.R
	Rscript assignment.cmd $<

#chapter01.pdf :: 

all:: chapter01.pdf
