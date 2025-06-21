#!/bin/bash

OLDDIR=../NBER-old
DIFFFILE=main.tex
OUTPUT=diff.tex

LATEXDIFF_OPTS=

latexdiff $LATEXDIFF_OPTS ${OLDDIR}/$DIFFFILE  $DIFFFILE > $OUTPUT 
pdflatex $OUTPUT
biber $(basename $OUTPUT .tex)
pdflatex $OUTPUT
pdflatex $OUTPUT

[[ -f $(basename $OUTPUT .tex).pdf ]] && echo "Created $(basename $OUTPUT .tex).pdf"