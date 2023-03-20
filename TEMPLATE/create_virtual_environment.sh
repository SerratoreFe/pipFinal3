 # Create the virtual environment
pyenv virtualenv $python_version $project_name"_"$python_version

# Set the virtual environment as the local environment
pyenv local $project_name"_"$python_version # create .python-version file

# Install the virtual environment using pipenv inside pyenv shell
pyenv shell
pipenv install # create Pipfile and Pipfile.lock files
pipenv shell exit
