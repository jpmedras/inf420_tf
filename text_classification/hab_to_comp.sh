#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto"
cd "$project_dir"/text_classification

LC=('1 2 3 4' '5 6 7 8' '9 10 11' '12 13 14' '15 16 17' '18 19 20' '21 22 23 24' '25 26 27' '28 29 30')
#9

CH=('1 2 3 4 5' '6 7 8 9 10' '11 12 13 14 15' '16 17 18 19 20' '21 22 23 24 25' '26 27 28 29 30')
#6

CN=('1 2 3 4' '5 6 7' '8 9 10 11 12' '13 14 15 16' '17 18 19' '20 21 22 23' '24 25 26 27' '28 29 30')
#8

MT=('1 2 3 4 5' '6 7 8 9' '10 11 12 13 14' '15 16 17 18' '19 20 21 22 23' '24 25 26' '27 28 29 30')
#7

dest="data_comp"
data="data_hab"

cont=1
for list in "${LC[@]}"
do
  echo "LC$cont" "${list}"
  mkdir -p $dest/"LC$cont"
  for h in $list
  do
  	for file in $(ls $data/LC$h/*)
  	do
  		cp $file $dest/"LC$cont"/
  	done
  done
  
  cont=$((cont+1))
done

cont=1
for list in "${CH[@]}"
do
  echo "CH$cont" "${list}"
  mkdir -p $dest/"CH$cont"
  for h in $list
  do
  	for file in $(ls $data/CH$h/*)
  	do
  		cp $file $dest/"CH$cont"/
  	done
  done
  
  cont=$((cont+1))
done

cont=1
for list in "${CN[@]}"
do
  echo "CN$cont" "${list}"
  mkdir -p $dest/"CN$cont"
  for h in $list
  do
  	for file in $(ls $data/CN$h/*)
  	do
  		cp $file $dest/"CN$cont"/
  	done
  done
  
  cont=$((cont+1))
done

cont=1
for list in "${MT[@]}"
do
  echo "MT$cont" "${list}"
  mkdir -p $dest/"MT$cont"
  for h in $list
  do
  	for file in $(ls $data/MT$h/*)
  	do
  		cp $file $dest/"MT$cont"/
  	done
  done
  
  cont=$((cont+1))
done

# Back directory
cd "$directory"
