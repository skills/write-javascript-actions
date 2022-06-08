# GIT tics

# Fetch a file from another branch to the current one
git checkout branch_name -- filename

# Unstage all changes but leave files in the working directory untouched
git reset HEAD

# Unstage a file
git reset HEAD <filename>

# Go back to last commit and remove all changes from working directory
git reset HEAD --hard

# Delete untracked files
git clean -f

# Compare two branches
git diff develop..master

# Compare two commits
git diff <sha>..<sha>

## Unstage file
```bash
git reset filename
```

## Unstage deleted file
```bash
git checkout HEAD filename
```

## Undo commit
```bash
git reset --soft HEAD\^
```

## Checkout remote branch
```bash
git fetch origin
git checkout develop
```

## Go back to previous branch
```bash
git checkout -
```

## Create empty master branch
```bash
git branch -D master
git checkout --orphan master
```
## Tag the release
```bash
# optional: tag important things, such as releases 
git tag 1.0.0-RC1
```

## Delete local tag
```bash
git tag -d v0.2.0
```

## Delete remote tag
```bash
git push origin :refs/tags/v0.2.0
```

## Amend last commit
If you want to change the message of the latest commit do
```bash
git commit --amend -m "New commit message"
```

## Revert specific file to previous version
If you want to revert a specific file to its previous version do
```bash
git checkout -- filename
```

## Undo all changes in branch
If you want to reset all non-committed changes do
```bash
git reset --hard
```

## Restore a file deleted in a previous commit
If you want to restore a file deleted in a previous commit do
```bash
git rev-list -n 1 HEAD -- <file_path>
git checkout <deleting_commit>^ -- <file_path>
```

## Remove a file from a commit that has not been pushed
If you want to remove a specific file from a commit that has not been pushed do
```bash
git reset HEAD filename
```
You can do it without the --, but if the filename looks like a branch or tag (or other revision identifier), it may get confused, so using -- is best.

## Checkout specific version of file
You can also check out a particular version of a file
```bash
git checkout v1.2.3 -- filename         # tag v1.2.3
git checkout stable -- filename         # stable branch
git checkout origin/master -- filename  # upstream master
git checkout HEAD -- filename           # the version from the most recent commit
git checkout HEAD^ -- filename          # the version before the most recent commit
```

## Remove a commit that has not been pushed
```bash
git reset --hard HEAD^
```
to reset to the previous commit before the current head; that way you don't have to be copying around commit IDs.

## Revert a commit
Identify the hash of the commit, using `git log`, then use `git revert <commit>` to create a new commit that removes these changes. In a way, `git revert` is the converse of `git cherry-pick` -- the latter applies the patch to a branch that's missing it, the former removes it from a branch that has it.

## Create a patch
```bash
git commit ...
git checkout <branch_to_apply_patch_to>
git format-patch <branch_to_compare_against> --stdout > fix_empty_poster.patch
git apply --stat fix_empty_poster.patch
git apply --check fix_empty_poster.patch
git am --signoff < fix_empty_poster.patch
```
or
```bash
git diff > fix_empty_poster.patch
git apply fix_empty_poster.patch
```

## Sync a fork
Add remote repository `upstream`.
```bash
git remote add upstream https://github.com/trntv/yii2-starter-kit.git
```
Fetch latest commit from it
```bash
git fetch upstream
```
Merge these commits to your repository
```bash
git checkout master
git merge upstream/master
```
**IMPORTANT: there might be a conflicts between `upstream` and your code. You should resolve merging conflicts on your own**

## Prune remote branches
```bash
git fetch --prune && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
```
 
## Submodules
If you want to use someone else's repo as a Git Submodule on GitHub do
```bash
git submodule add git://github.com/username/repo.git destination/folder
git submodule init
git submodule update
```
from the root of your project.

## Stash
```bash
git stash save
git stash save --include-untracked (-u)
git stash pop (git stash apply && git stash drop)
git stash apply (to re-use same stash later)
git stash list
git stash show
git stash apply
git stash branch testchanges
```
## Renaming branches
If you want to rename a branch while pointed to any branch, do :
```
git branch -m <oldname> <newname>
```
If you want to rename the current branch, you can do:
```
git branch -m <newname>
```

## git-extras
```bash
git setup (from git-extras)
git ignore .DS_Store
git summary
git effort --above 10
git undo
```
