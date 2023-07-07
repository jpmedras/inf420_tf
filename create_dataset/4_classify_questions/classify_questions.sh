#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto/create_dataset"
cd "$project_dir/4_classify_questions"

mkdir -p $year
for a in LC CH CN MT
do
	for h in {1..30}
	do
		mkdir -p $year/$a/$h
	done
done

# Moving questions to classified path
questions=$(ls ../3_texts_to_questions/$year/$day/)

# echo $questions ../3_texts_to_questions/$year/$day/

echo Classifying questions from "$year/$day"

search='-'
code1=$(cat ../codigo_prova/$year/$day/code1)
code2=$(cat ../codigo_prova/$year/$day/code2)

for file in $questions
do	
	rest=${file#*$search}
	number=${file:0:${#file}-${#rest}-1}
	page=${rest:0:-4}
	lang="l"
	
	if [ "$page" != "${page#*$search}" ]; then
		rest=${page#*$search};
		page=${page:0:${#page}-${#rest}-1};
		lang=${rest};
	fi
	
	# echo $file $number $page $type
	
	# echo $year/$day/$number-$page
	# python3 classify_question.py $year $day $number $code1 $code2 $type $lang $color v
	area=$(python3 classify_question.py $year $day $number $code1 $code2 $type $lang $color a)
	habilidade=$(python3 classify_question.py $year $day $number $code1 $code2 $type $lang $color h)
	
	echo -e "\tQuestion $year/$day/"$number"-"$page" in $area$habilidade"
	
	from=../3_texts_to_questions/$year/$day/$file
	to="$year/$area/$habilidade/"$year"-"$file""
	# echo -e '\t'FROM=$from TO=$to
	cp $from $to
	

done

# Back directory
cd "$directory"
