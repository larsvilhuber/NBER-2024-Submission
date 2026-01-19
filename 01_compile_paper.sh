#!/bin/bash

MAIN=main.tex
OUTPUTPRE=NBER_2024_Vilhuber-submitted
OUTPUTTAG=$(date +%F)
OUTPUT="${OUTPUTPRE}-${OUTPUTTAG}"

[[ -f $(basename $MAIN .tex).pdf ]] && echo "Removing old $(basename $MAIN .tex).pdf" && rm $(basename $MAIN .tex).pdf
pdflatex $MAIN
biber $(basename $MAIN .tex)
pdflatex $MAIN
pdflatex $MAIN

if [[ -f $(basename $MAIN .tex).pdf ]] 
then
  echo "Created $(basename $MAIN .tex).pdf"
  echo "Moving to $OUTPUT"
  mv $(basename $MAIN .tex).pdf ${OUTPUT}.pdf
else
  echo "Dunno. Something wrong"
fi
