#!/usr/bin/env bash
# Make sure this file is executable
# chmod a+x .github/script/update-step.sh

echo "Check that we are on FROM_STEP"
if [ "$(cat .github/steps/-step.txt)" != $FROM_STEP ]
then
  echo "Current step is not $FROM_STEP"
  exit 0
fi

echo "Make sure we are on the main branch"
git checkout main

echo "TODO NEEDS UPDATE"

echo "Update the step file to TO_STEP"
echo "$TO_STEP" > .github/steps/-step.txt

echo "Commit the files, and push to main"
git config user.name github-actions
git config user.email github-actions@github.com
git add README.md
git add .github/steps/-step.txt
git commit --message="Update to $TO_STEPin step and README.md"
git push

echo "If BRANCH_NAME, update that branch as well"
if git show-ref --quiet refs/heads/$BRANCH_NAME
then
  git checkout $BRANCH_NAME
  git cherry-pick main
  git push
else
  echo "Branch $BRANCH_NAME does not exist"
fi
