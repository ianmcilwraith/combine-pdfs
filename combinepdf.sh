#!/bin/bash

LIST=( * )

# Remove .pdf extension. merge pdfs. delete originals.
for x in "${LIST[@]}" ; do
    y=${x%%.pdf}
    if [ $(ls "$y"*.pdf 2>/dev/null | wc -l ) -gt 1 ]; then
        pdftk "$y"*.pdf cat output "$y"_merged.pdf
        find "$y"*.pdf -type f ! -iname "*_merged.pdf" -delete
    fi
done
