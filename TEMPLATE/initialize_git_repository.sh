# Config git to global parameters stored inside ~/-gitconfig
git config --global user.name "$username"
git config --global user.email "$email"

# Check if specified github token is already laoded
if [ -f ~/.git-credentials ] && [ "$(cat ~/.git-credentials | grep $token)" == "" ]; then
  git config --global credential.helper "store --file=~/.git-credentials" 'cache --timeout=3600'
  echo "https://$token:x-oauth-basic@github.com" > ~/.git-credentials
fi

#Initialize the Git repository
git init

# Create a new repository on GitHub
curl -u "$username:$token" https://api.github.com/user/repos -d "{\"name\":\"$project_name\"}"

#Add the remote repository to the local Git repository
git config remote.origin.url "https://$username:$token@github.com/$username/$project_name.git"

#Add all files to the Git repository
git add .

#Commit the changes
git commit -m "Initial commit"

#Push the changes to the remote repository
git push -u origin master

#Cleaning the token
git config --global --unset credential.helper
