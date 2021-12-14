#!/bin/bash
set -e

# logs a missing env error
missing_env () {
  echo "Error: \$$1 ENV is required, but was undefined."
}

# verifies all the required environment variables are set
check_envs() {
  if [[ -z $ACTION_WORKSPACE ]]; then
    missing_env "ACTION_WORKSPACE"
    exit 1
  fi

  if [[ -z $INPUT_CLI_GIT_BRANCH ]]; then
    missing_env "INPUT_CLI_GIT_BRANCH"
    exit 1
  fi

  if [[ -z $INPUT_TAP_REF ]]; then
    missing_env "INPUT_TAP_REF"
    exit 1
  fi

  if [[ -z $INPUT_REPOSITORY ]]; then
    missing_env "INPUT_REPOSITORY"
    exit 1
  fi

  if [[ -z $INPUT_TAG ]]; then
    missing_env "INPUT_TAG"
    exit 1
  fi

  if [[ -z $INPUT_TOKEN ]]; then
    missing_env "INPUT_TOKEN"
    exit 1
  fi

  if [[ -z $INPUT_USER ]]; then
    missing_env "INPUT_USER"
    exit 1
  fi
}

check_envs

echo "==== Starting Tap Build Action"

source $ACTION_WORKSPACE/scripts/cli.sh
source $ACTION_WORKSPACE/scripts/auth.sh
source $ACTION_WORKSPACE/scripts/tap.sh
