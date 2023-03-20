#!/bin/bash

# Create the project structure
<<Commento
touch "$project_directory/README.md"

# Changes all placeholders inside template file
awk -v project_name="$project_name" -v name="$name" -v email="$email"\
 -v python_version="$python_version" -v username="$username"\
 '{ gsub("{project_name}", project_name); gsub("{name}", name); gsub("{email}", email);
  gsub("{python_version}", python_version); gsub("{username}", username); print }'\
 "$template_directory/pyproject.toml" > "$project_directory/pyproject.toml"\

awk -v username="$username" '{ gsub("{username}", username); print }' "$template_directory/LICENSE" > "$project_directory/LICENSE"

mkdir "$project_directory/src"
mkdir "$project_directory/tests"
mkdir -p "$project_directory/src/"$package$project_name"_"$USER
touch "$project_directory/src/"$package$project_name"_"$USER"/"__init__.py
touch "$project_directory/src/"$package$project_name"_"$USER"/""$project_name".py

echo "---Created project structure in $project_directory"

cd "$project_directory"
mkdir .venv # In this way pyenv and pipenv create the virtualenv inside this directory instead than default directory

# Check if the specified python version is installed
#if [ "$(pyenv versions | grep $python_version | head -1)" -eq "" ]; then
#  echo "---Installing python version $python_version"
#  pyenv install $python_version
#else
#  echo "what?"
#fi
Commento

echo "$(pyenv versions | grep $python_version)"

if [ "$(pyenv versions | grep $python_version | head -1)" = "" ]; then
  pyenv install $python_version
fi
