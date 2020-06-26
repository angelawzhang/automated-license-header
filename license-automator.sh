#!/bin/bash

all_files=$(ls -a)
hash_symbol_syntax=('sh' 'yml' 'yaml' 'ini' 'py' 'j2' 'config')
minus_symbol_syntax=('lua')

echo "...ADDING LICENSE HEADERS..."

for file in $all_files; do
    # get file extension
    # file_name="${file%.*}"
    file_ext="${file##*.}"

    # if file extension is within extensions listed, add proper header
    if [[ "${hash_symbol_syntax[@]}" =~ "${file_ext}" ]]; then
        if ! grep -qi "Licensed Materials - Property of IBM Copyright IBM Corporation 2017. All Rights Reserved." "$file"; then
            cat hash_symbol_copyright.txt "$file" >"$file".new && mv "$file".new "$file"
            echo "$file: LICENSE WAS UPDATED"
        fi
    fi
done

echo "LICENSE HEADERS ADDED!"
