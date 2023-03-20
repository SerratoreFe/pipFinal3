#!/bin/bash
<<'Commento'
https://packaging.python.org/en/latest/tutorials/packaging-projects/
https://packaging.python.org/en/latest/tutorials/creating-documentation/
https://github.com/settings/tokens
Commento




# Set the absolute path of running bash script
ABSPathScript=$( dirname -- "$( readlink -f -- "$0"; )"; )
template_directory="$ABSPathScript/TEMPLATE"
export template_directory

echo "script running in: $ABSPathScript"

script_dir=$(pwd)
# Set the parameters
# token=$1
python_version=$1
project_name=$2
project_directory=$3

#Set Local Variable
username="SerratoreFe"
name="Serratore Federico"
email="19169@studenti.marconiverona.edu.it"
package="python/it/edu/marconi/"
