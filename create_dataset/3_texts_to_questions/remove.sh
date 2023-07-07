#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto/create_dataset"
cd "$project_dir/3_texts_to_questions"

# Extracting questions
questions=$(cat ../list_of_questions/$year/$day/list)
path="$year/$day"

for q in $questions
do
	rm -v -f "$path"/"$q.txt"
done
	
# Back directory
cd "$directory"
