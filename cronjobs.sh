#!/bin/bash

# Set the path to the script you want to run
SCRIPT_PATH="/path/to/your_script.sh"

# Add the cron job to run the script every hour
(crontab -l ; echo "0 * * * * $SCRIPT_PATH") | crontab -

# Set the path to the git repository
REPO_PATH="/path/to/your/git/repo"

# Add the cron job to run the git tagging at 6 am every Monday
(crontab -l ; echo "0 6 * * 1 cd $REPO_PATH && git tag $(date +\%Y-\%m-\%d) && git push --tags") | crontab -
