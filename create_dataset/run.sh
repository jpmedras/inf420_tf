#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto/create_dataset"
cd "$project_dir"

year=2019
day=2
color='Azul' # cor da prova (de acordo com ITENS_PROVA.csv)
div='Questão' # divisor de questões (de acordo com PDF)

export year
export day
export color
export div

clear

# Clear files
./clean.sh

# List pages
./list_of_pages/list_of_pages.sh

# Separating pages
echo Separating pages
./1_separate_pages/separate_pages.sh
echo

# Pages to text
echo Pages to text
./2_pages_to_text/pages_to_text.sh
echo

# Texts to questions
echo Texts to questions
./3_texts_to_questions/texts_to_questions.sh
./3_texts_to_questions/remove.sh
./3_texts_to_questions/ing_esp.sh
echo

# Classifying questions
echo Classifying questions
./4_classify_questions/classify_questions.sh

# Back directory
cd "$directory"
