#!/bin/bash

find_file() {

    all_files=$(ls -a $1)
    hash_symbol_syntax=('sh' 'yml' 'yaml' 'ini' 'py' 'j2' 'config')
    minus_symbol_syntax=('lua')

    for file in $all_files; do
        # get file extension
        # file_name="${file%.*}"
        file_ext="${file##*.}"

        # if file extension is within extensions listed, add proper header
        if [[ "${hash_symbol_syntax[@]}" =~ "${file_ext}" ]]; then
            if ! grep -qi "Licensed Materials - Property of IBM Copyright IBM Corporation 2017. All Rights Reserved." "$1/$file"; then
                cat hash_symbol_copyright.txt "$1/$file" >"$1/$file".new && mv "$1/$file".new "$1/$file"
                echo "$file: LICENSE WAS UPDATED"
            fi
        elif [ -d $1/$file ] && [ $file != '.' ] && [ $file != '..' ]; then
            find_file $1/$file
        fi
    done
}

echo "...ADDING LICENSE HEADERS..."
find_file $1
echo "LICENSE HEADERS ADDED!"