set -e

clone_cli () {
  echo "==== Cloning Keg-CLI branch $INPUT_CLI_GIT_BRANCH"
  git -C $ACTION_WORKSPACE clone --single-branch --branch $INPUT_CLI_GIT_BRANCH https://github.com/KegHub/keg-cli.git
}

install_cli () {
  echo "==== Installing Keg-CLI dependencies..." 
  cd $ACTION_WORKSPACE/keg-cli
  yarn install --ignore-engines
}

setup_cli () {
  cd $ACTION_WORKSPACE/keg-cli

  KEG_ROOT_DIR=$ACTION_WORKSPACE/keg-hub \
    bash scripts/ci/setupCLIConfig.sh
}

clone_cli
install_cli
setup_cli