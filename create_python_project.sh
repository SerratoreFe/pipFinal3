#!/bin/bash

echo "---CREATE PYTHON PROJECT---"

t_dir='./TEMPLATE'

echo "---Running init.sh"
. "$t_dir/init.sh"
if [ $? -eq "1" ]; then
  exit 1
else
  echo "---init.sh runned without errors"
fi
echo

echo "---Create project structure"
. "$t_dir/create_project_structure.sh"
if [ $? -eq "1" ]; then
  exit 1
else
  echo "---Project structure created succesfully"
fi


echo "---Check parameters"
. "$t_dir/check_parameters.sh"
if [ $? -eq "1" ]; then
  exit 1
else
  echo "---Parameters checked succesfully"
fi


echo "---Check directory existance"
. "$t_dir/create_project_directory.sh"
if [ $? -eq "1" ]; then
  exit 1
else
  echo "---Directory checked succesfully"
fi


echo "---Create project structure"
. "$t_dir/create_project_structure.sh"
if [ $? -eq "1" ]; then
  exit 1
else
  echo "---Project structure created succesfully"
fi

echo "prova"
echo "---Create virtual environment"
. "$t_dir/create_virtual_environment.sh"
if [ $? -eq "1" ]; then
  exit 1
else
  echo "---Virtual environment created succesfully"
fi


echo "---Initialize git repository"
. "$t_dir/initialize_git_repository.sh"
if [ $? -eq "1" ]; then
  exit 1
else
  echo "---Git repository created succesfully"
fi


