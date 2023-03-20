# Create the project directory if it doesn't exist
if [ ! -d "$project_directory" ]; then
  mkdir $project_directory
<<'Commento'
  else
  
  echo 'Error: folder already exists.' >&2
  exit 1
Commento
fi
