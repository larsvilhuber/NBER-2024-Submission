#!/bin/bash

TAG=${1:-$(date +%F)}


zip -rp NBER_2024_Vilhuber-submitted-${TAG}.zip \
        main.tex abstract.tex acrodefs.tex listings-stata.tex \
        config.do \
        hdsr.cls  \
        *txt \
        main.bbl \
        references.bib \
        table-coverage.tex \
        responses.tex \
        figs/ 
