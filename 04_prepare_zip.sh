#!/bin/bash

TAG=${1:-$(date +%F)}


zip -rp NBER_book_2026_Vilhuber-submitted-${TAG}.zip \
        nber-volume-vilhuber.tex  acrodefs.tex nber-volume-vilhuber.bbl \
        references.bib \
        table-coverage.tex \
        figs/ 
