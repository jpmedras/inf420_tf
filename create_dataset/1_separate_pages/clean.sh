#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto/create_dataset"
cd "$project_dir/1_separate_pages"

for file in $(ls $year/$day/)
do
	rm -vf $year/$day/$file
done

# Back directory
cd "$directory"
