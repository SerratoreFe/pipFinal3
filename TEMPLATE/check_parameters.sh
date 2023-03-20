#!/bin/bash
# Check if the template directory exists
if [ ! -d "$template_directory" ]; then
  echo 'Error: Template directory does not exist.' >&2
  exit 1
fi

if ! [ -x "$(command -v ssh)" ]; then
  echo 'Error: openssh-client does not exists.' >&2
  exit 1
fi

if [ ! -e ~/.ssh/id_rsa.pub ]; then
    echo "Error: public key doesn't exists."
    exit 1
fi

if [ ! -e ~/.ssh/id_rsa ]; then
    echo "Error: private key doesn't exists."
    exit 1
fi

if [ ! -e ~/.ssh/known_hosts ]; then
    echo "Error: known_host file doesn't exists."
    exit 1
fi

# Check if the template files exist
if [ ! -f "$template_directory/pyproject.toml" ] || [ ! -f "$template_directory/LICENSE" ]; then
  echo 'Error: Template files do not exist.' >&2
  exit 1
fi
echo "2. Check on Template directory and files passed!"

# Check if pyenv, pyenv-virtualenv, pipenv, git and curl are installed
if ! [ -x "$(command -v pyenv)" ]; then
  echo 'Error: pyenv is not installed.' >&2
  exit 1
fi


if ! [ -x "$(command -v virtualenv)" ]; then
  echo 'Error: virtualenv is not installed.' >&2
  exit 1
fi


if ! [ -x "$(command -v pipenv)" ]; then
  echo 'Error: pipenv is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  exit 1
fi
echo "3. Check on installed tools passed!"

# Check if all parameters are provided
if [ -z "$python_version" ] || [ -z "$project_name" ] || [ -z "$project_directory" ]; then
  echo "Error: All parameters are required. Please provide the token, python version, project name and project directory." >&2
  exit 1
fi
echo "1. Check on parameters passed!"
