#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto/create_dataset"
cd "$project_dir/4_classify_questions"

for area in $(ls $year/)
do
	for habilidade in $(ls $year/$area/)
	do
		for file in $(ls $year/$area/$habilidade)
		do 
			rm -vf $year/$area/$habilidade/$file
		done
	done
done

# Back directory
cd "$directory"
