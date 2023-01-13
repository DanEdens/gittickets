# Jira Board Status Update

This repository contains scripts for pulling the status of a board's Jira tickets, committing the information to a git repository, and creating a tag with the current date in format `YYYY-MM-DD` every Monday between 6 and 7 am.

## Bash Script
```bash
#!/bin/bash

JIRA_USERNAME="your_username"
JIRA_API_TOKEN="your_api_token"
BOARD_ID="your_board_id"

curl --user "$JIRA_USERNAME:$JIRA_API_TOKEN" -X GET "https://your_jira_url/rest/agile/1.0/board/$BOARD_ID/issue?fields=status" > jira_board_status.json

git add jira_board_status.json
git commit -m "Update Jira board status"
git push

if [ "$(date +%A)" == "Monday" ] && [ "$(date +%H)" -ge "6" ] && [ "$(date +%H)" -lt "7" ]; then
    git tag $(date +%Y-%m-%d)
    git push --tags
fi

```

This script uses curl command to make a REST call to Jira and retrieve the status of the board, and stores the response in a file jira_board_status.json. Then it uses git command to commit the file jira_board_status.json to the git repository and push it to the remote. Finally, it uses if statement with date command to check if the current day is Monday, and the hour is between 6 and 7 am, if so, it creates a tag with the current date in format YYYY-MM-DD and pushes it to the remote repository.

You will need to replace the values of JIRA_USERNAME, JIRA_API_TOKEN, BOARD_ID, https://your_jira_url with your own information.



# Jenkinsfile

if you want to use the Jenkinsfile, you will need to have a Jenkins server set up with the git and pipeline plugins installed and configured. Also, you will need to replace the values of JIRA_USERNAME, JIRA_API_TOKEN, BOARD_ID, and GIT_REPO_URL with your own information. Also, the user running this Jenkinsfile needs to have permission to create a tag and push it to the remote repository.



# Github Action

And, if you want to use the GitHub Actions workflow you will need to create a workflow file in your repository .github/workflows/jira-board-status-update.yml and replace the values of JIRA_USERNAME, JIRA_API_TOKEN, BOARD_ID, OWNER, REPO, BRANCH, https://your_jira_url with your own information and also make sure to set the secrets for the variables in your repository settings.

