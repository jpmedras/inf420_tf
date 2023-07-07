#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto/create_dataset"
cd "$project_dir/3_texts_to_questions"

mkdir -p $year
mkdir -p $year/$day

# Extracting questions
pages=$(cat ../list_of_pages/$year/$day/pages)
files=$(ls ../2_pages_to_text/$year/$day/)

# echo $pages
# echo $files

echo Getting questions from "$year/$day"
for p in $pages
do
	echo -e "\tGetting questions from "$year/$day/page$p.txt"" && python3 text_to_questions.py $year $day $p $div
	# echo -e "\t$year $day $p $div"
done

# Back directory
cd "$directory"
