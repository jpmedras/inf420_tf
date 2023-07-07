#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto/create_dataset"
cd "$project_dir"

dir='data_f_by_area'

mkdir -p "../text_classification/$dir" &&

for year in $(ls "brute_data/")
do
	for a in $(ls "4_classify_questions/$year")
	do
		for h in $(ls "4_classify_questions/$year/$a")
		do
			mkdir -p "../text_classification/$dir/$a"
			
			for f in $(ls "4_classify_questions/$year/$a/$h")
			do
				from="4_classify_questions/$year/$a/$h/$f"
				to="../text_classification/$dir/$a/"$year"_"$f""
				cp $from $to
			done
		done
	done
done

# Back directory
cd "$directory"
