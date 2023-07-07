#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto/create_dataset"
cd "$project_dir"

# Generate a file with 1 .. (number of pages)
for file in $(ls "brute_data/$year/$day/"*.pdf)
do
	mkdir -p list_of_pages/$year/$day/
	touch "list_of_pages/$year/$day/pages" &&
	echo -n > "list_of_pages/$year/$day/pages" &&
	number=$(qpdf --show-npages $file) &&
	
	for p in $(seq 1 $number)
	do
		echo -n "$p " >> "list_of_pages/$year/$day/pages"
	done
done

# Back directory
cd "$directory"
