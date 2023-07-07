#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto/create_dataset"
cd "$project_dir/1_separate_pages"

mkdir -p $year
mkdir -p $year/$day

# Extracting pages
pages=$(cat ../list_of_pages/$year/$day/pages)
file=$(ls ../brute_data/$year/$day/)
echo Extracting pages from "$year/$day/$file"
for p in $pages; do echo -e "\tExtracting page $p" && pdfseparate -f $p -l $p ../brute_data/$year/$day/$file $year/$day/page$p.pdf; done

# Back directory
cd "$directory"
