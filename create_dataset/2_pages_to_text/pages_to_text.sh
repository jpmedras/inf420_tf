#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto/create_dataset"
cd "$project_dir/2_pages_to_text"

mkdir -p $year
mkdir -p $year/$day

# Converting pages
files=$(ls ../1_separate_pages/$year/$day/)
echo Converting pages from "$year/$day" to text
for f in $files; do echo -e "\tConverting $f to ${f:0:-4}.txt" && pdftotext -nopgbrk -raw -x 20 -y 50 -W 700 -H 700 ../1_separate_pages/$year/$day/$f $year/$day/"${f:0:-4}.txt"; done

# Back directory
cd "$directory"
