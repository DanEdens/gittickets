#!/bin/bash

# Set Jira credentials
JIRA_USERNAME="your_username"
JIRA_API_TOKEN="your_api_token"

# Set Jira board and git repository information
BOARD_ID="your_board_id"
GIT_REPO_URL="https://your_git_repo.git"

# Authenticate to Jira
curl --user "$JIRA_USERNAME:$JIRA_API_TOKEN" -X GET "https://your_jira_url/rest/agile/1.0/board/$BOARD_ID/issue?fields=status" > jira_board_status.json

# Commit the Jira board status to the git repository
git init
git remote add origin $GIT_REPO_URL
git add jira_board_status.json

# Get the list of changed files
CHANGED_FILES=`git diff --name-only HEAD`

# Commit with the list of changed files in the message
git commit -m "Update Jira board status. Changed files: $CHANGED_FILES"
git push -u origin master

