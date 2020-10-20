#!/bin/bash
# GitHub API Token
GITHUB_API_TOKEN='c0243dc2689c2b215462795accac329ab5495671'

# GitHub User Name
GITHUB_USERNAME='chektien'

# Variable to store 1st cl argument, the github repo name
NEW_REPO_NAME=$1

# Store current working directory.
CURRENT_DIR=$PWD

# Project directory can be passed as second argument to setup-repo, or will default to current working directory.
PROJECT_DIR=${2:-$CURRENT_DIR}

# call GitHub API to create repo
curl -H "Authorization: token $GITHUB_API_TOKEN" https://api.github.com/user/repos -d '{"name": "'"${NEW_REPO_NAME}"'"}'
git init $PROJECT_DIR

# init git in project directory, and add the github repo remote.
git -C $PROJECT_DIR remote add origin git@github.com:$GITHUB_USERNAME/$NEW_REPO_NAME.git
