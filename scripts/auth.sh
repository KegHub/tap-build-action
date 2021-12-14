set -e

echo "==== Setting up Keg-CLI auth..." 

echo "::debug::Current ENVS"
printenv
echo "::debug::Current ENVS"

echo "::debug::Loading Keg-CLI.sh script at path $ACTION_WORKSPACE/keg-hub/repos/keg-cli/keg"
source $ACTION_WORKSPACE/keg-hub/repos/keg-cli/keg

set_creds () {
  echo "::debug::Setting Keg Docker User to $INPUT_USER"
  keg config set key=docker.user value=$INPUT_USER --confirm false
  echo "::debug::Setting Keg git token..."
  keg git key add value=$INPUT_TOKEN
}

set_git_user () {
  echo "::debug::Setting Keg git user to $INPUT_USER"
  git config --global user.name $INPUT_USER
}

docker_login () {
  echo "::debug::Logging into docker..."
  keg dp login 
}

set_creds
set_git_user
docker_login