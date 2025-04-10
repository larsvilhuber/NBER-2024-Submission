#!/bin/bash

# Find page where Responses section starts in diff.pdf
DIFF_RESPONSES_PAGE=$(pdfgrep -n "Responses" diff.pdf | cut -d':' -f1)
DIFF_BEFORE_PAGE=$((DIFF_RESPONSES_PAGE - 1))

# Find page where Responses section starts in NBER PDF
NBER_PDF="NBER_2024_Vilhuber-submitted-20250410.pdf"
NBER_NAME="$(basename $NBER_PDF .pdf)"
NBER_RESPONSES_PAGE=$(pdfgrep -n "Responses" "$NBER_PDF" | cut -d':' -f1)
NBER_BEFORE_PAGE=$((NBER_RESPONSES_PAGE - 1))

# Process diff.pdf - remove responses section
echo "Removing Responses section from diff.pdf (pages ${DIFF_RESPONSES_PAGE}-end)..."
qpdf --pages diff.pdf 1-${DIFF_BEFORE_PAGE} -- diff.pdf diff-no-responses.pdf

# Split NBER PDF into two parts
echo "Extracting part without Responses from $NBER_PDF (pages 1-${NBER_BEFORE_PAGE})..."
qpdf --pages "$NBER_PDF" 1-${NBER_BEFORE_PAGE} -- "$NBER_PDF" "${NBER_NAME}-manuscript.pdf"

echo "Extracting Responses section from $NBER_PDF (pages ${NBER_RESPONSES_PAGE}-z)..."
qpdf --pages "$NBER_PDF" ${NBER_RESPONSES_PAGE}-z -- "$NBER_PDF" "${NBER_NAME}-responses.pdf"

echo "Processing complete."
