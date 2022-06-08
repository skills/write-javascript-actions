#!/usr/bin/env bash
# Make sure this file is executable
# chmod a+x .github/script/initialize-repository.sh

# USAGE: This should only be run once upon initial creation of the
# learner's repository from the template repository. 
# Does a dry run by default, --dry-run=false to run live.

# PURPOSE: This script establishes an initial related history for 
# all branches. It merges main into all other branches in this repository 
# while auto-resolving conflicts in favor of main.

# BACKGROUND: This operation is required because when a repository is 
# created from a template repository with 'Include all branches', each 
# of the branches starts with only one initial commit and no related history.
#
# That state makes it impossible to create pull requests from the 
# step-specific branches into main as the learner progresses
# through the course.

# Setup committer identity
git config user.name github-actions
git config user.email github-actions@github.com

# Fetch all remote branches
git pull --all

# Create list of all remote branches
branches=$(git branch -r | grep -v main | sed -r 's/origin\///g' | paste -s -d ' ' -)

# Merge main into each branch
echo -e "Merge main into each branch\n---"
for branch in $branches
do
    # Dry run by default
    if [[ $1 = '--dry-run=false' ]]
    then
        git checkout "$branch"
        git pull origin main --no-rebase -X theirs --allow-unrelated-histories --no-edit
        git push origin "$branch"
        echo "---"
    else
        echo "plan: merge main into $branch"
    fi
done
