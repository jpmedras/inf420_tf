#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto/create_dataset"
cd "$project_dir/3_texts_to_questions"

for q in {1..5}
do
	files=$(ls $year/$day/$q-*)
	
	cont=0
	for f in $files
	do
		mv $f "${f:0:-4}"-"$cont".txt
		cont=$((cont + 1))
	done
done

# Back directory
cd "$directory"
