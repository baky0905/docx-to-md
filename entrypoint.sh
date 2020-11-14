#!/usr/bin/env bash
find . -name '*.docx' > filelist.dat

while read file
do
  base_name=$( echo "${file}" | basename "${file}" | sed -e 's/\.docx//g')
  pandoc -f markdown ${file} -o ${MD_DIR}/${base_name}.md
  #git status
  #git diff
done < filelist.dat

rm filelist.dat
