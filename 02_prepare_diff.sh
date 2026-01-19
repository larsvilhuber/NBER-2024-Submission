#!/bin/bash

OLDFILE=nber-volume-vilhuber-old.tex
DIFFFILE=nber-volume-vilhuber.tex
OUTPUT=diff.tex

LATEXDIFF_OPTS=

latexdiff $LATEXDIFF_OPTS ${OLDFILE} $DIFFFILE > $OUTPUT 
pdflatex $OUTPUT
bibtex $(basename $OUTPUT .tex)
pdflatex $OUTPUT
pdflatex $OUTPUT

[[ -f $(basename $OUTPUT .tex).pdf ]] && echo "Created $(basename $OUTPUT .tex).pdf"