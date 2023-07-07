#!/bin/bash

# Saving directory
directory=$(pwd)
project_dir="/home/joao/CC/Periods/5/inf420_inteligencia_artificial/TPF/Projeto/create_dataset"
cd "$project_dir"

# Separating pages
./1_separate_pages/clean.sh
./2_pages_to_text/clean.sh
./3_texts_to_questions/clean.sh

# Back directory
cd "$directory"
