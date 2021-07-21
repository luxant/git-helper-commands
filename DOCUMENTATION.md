# Git 👾

## Most used cmds

✔️ **g.st**

❌ instead of *git status*

show the status of the repository

✔️ **g.st.untracked**

❌ instead of *git status -u*

show the status of the repository including untracked files

✔️ **g.lg**

❌ instead of *git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative --date-order*

show the log of the repository

✔️ **g.ck** [file_path | directory_path] ( Tab completion enabled )

❌ instead of *git checkout*

alias for the git checkout

✔️ **g.add** [file_path | directory_path] ( Tab completion enabled )

❌ instead of *git add*

alias for the git add

✔️ **g.co** [message]

❌ instead of *git commit -m* message

✔️ **g.amend.changes**

❌ instead of *git commit --amend --no-edit*

this command has the same effects that git commit –amend –no-edit meaning it will append your staged changes to the HEAD commit of your branch without needing to commit or adding a message

✔️ **g.amend.message** [commit_message]

❌ instead of *git commit --amend --cleanup=whitespace*

helps update the message of a commit

✔️ **g.fetch**

❌ instead of *git fetch origin*

will fetch from $G_GIT_REMOTE_NAME (default: origin)

✔️ **g.diff** [optional: file_path] ( Tab completion enabled )

❌ instead of *git diff --patience*

## Git pull and push

✔️ **g.pull** [optional: branch_name] ( Tab completion enabled )

❌ instead of *git fetch origin*

❌ instead of *git pull --rebase origin your_brach*

❌ instead of *git status*

pull from the remote branch (at $G_GIT_REMOTE_NAME) received as parameter, but if none is given the local current branch name is used by default. This command will automatically:

1. fetch from upstream before pull,
2. then pull after that
3. and then it will show the status of your current branch

**NOTE:** g.pull uses *git pull --rebase*, is you want just to use *git pull* use g.pull.raw

✔️ **g.push**

❌ instead of *git push origin your_branch*

changes committed to the current branch are uploaded to your configured remote ($G_GIT_REMOTE_NAME). The local branch name is used as the new origin branch

✔️ **g.push.force**

❌ instead of *git push --force origin your_branch*

changes committed to the current branch are force uploaded to $G_GIT_REMOTE_NAME (default: origin). The local branch is used as the new origin branch

## Diff

✔️ **g.diff.without.spaces** [optional: file_path]

❌ instead of *git diff --patience --ignore-space-at-eol*

make a git diff ignoring white spaces

✔️ **g.diff.raw** [optional: file_path]

❌ instead of *git diff --patience --ignore-space-at-eol*

make a git diff ignoring white spaces

✔️ **g.diff.staged** [optional: file_path]

❌ instead of *git diff --staged*

makes a diff of a staged file

✔️ **g.diff.hash** [optional: commit_num]

❌ if you don't supply commits this will work instead of *git diff HEAD^ HEAD* or *git diff commit1^ commit2*

show the changes made by a commit, but if no parameter is given HEAD commit is used instead

## Git revert

✔️ **g.revert.untrack**

❌ instead of *git clean -fd*

revert changes made on untracked files

✔️ **g.revert.staged**

❌ instead of *git reset*

revert changes made on staged files

✔️ **g.revert.all**

❌ instead of *git merge --abort*

❌ instead of *git checkout .*

❌ instead of *git clean -fd*

revert changes made on any kind of file: tracked, untracked and merge conflicts.

## Git cherry-pick

✔️ **g.cherry-pick** [commit_num]

❌ git cherry-pick commit_nul

cherry-pick a commit to the current branch

✔️ **g.cherry-pick.range** [old_commit_num] [newest_commit_num]

❌ instead of *git cherry-pick $1^..$2*

g.cherry-pick a range of commits to the current branch

✔️ **g.cherry-pick.abort**

❌ instead of *git cherry-pick --abort*

abort the current cherry-pick operation

✔️ **g.cherry-pick.continue**

❌ instead of *git cherry-pick --continue*

go ahead and continue with the current cherry-pick operation

## Git branch

✔️ **g.branch**

❌ instead of *git branch*

list the current branches of the repository

✔️ **g.branch.rename** [new_branch_name] ( Tab completion enabled )

❌ instead of *git branch -m new_name*

If you need to rename a branch

✔️ **g.branch.delete** ( Tab completion enabled )

❌ instead of *git branch -D branch_name*

deletes the branches given as parameter

✔️ **g.branch.prune**

❌ instead of *git branch -D branch_name*

run this command when you want to clean up your workspace of old branches. this will delete all the branches except some "famous" ones like *master*, *stage*, *developer*, *develop*, *production* or *main*

## Git stash

✔️ **g.stash** [optioanl: stash_name]

❌ instead of *git stash*

save the current changes of the branch in the stash

✔️ **g.stash.pop**

❌ instead of *git stash pop*

recover the last saved state from the stash

✔️ **g.stash.drop**

❌ instead of *git stash drop*

delete the last saved state from the stash

✔️ **g.stash.apply**

❌ instead of *git stash apply*

applies the lastest stash to the current directory

✔️ **g.stash.untracked**

❌git stash --include-untracked

this will include unstracked files in the stash being done

## Git merge

✔️ **g.merge.abort**

❌ instead of *git merge --abort*

✔️ **g.merge.resolve.theirs**

❌ instead of *git merge -X theirs*

## Git rebase

✔️ **g.rebase.abort**

❌ instead of *git rebase --abort*

✔️ **g.rebase.continue**

❌ instead of *git rebase --continue*

## Git reset

✔️ **g.reset.soft** 

❌ instead of *git reset --soft*

✔️ **g.reset.hard**

❌ instead of *git reset --hard*

✔️ **g.reset.remote** [optional: remote_branch_name]

❌ instead of *git reset --hard $G_GIT_REMOTE_NAME/$branch*

this command will take the branch supplied as parameter or the current workspace branch name as reference to reset the actual branch equal to the remote branch. ⚠️*you may lose your local changes so stash them first*⚠️

## Search utilities

✔️ **g.s** [lookup_term] [optional: file_extension]

❌ instead of *git grep -n lookup_term*

❌ instead of *git grep -n lookup_term -- file_extension*

this command will print the matching lines for the term entered as parameter and optionally narrowing the search to certain file extension

✔️ **g.s.ignore.case** [lookup_term] [optional: file_extension]

❌ instead of *git grep -n  -ilookup_term*

❌ instead of *git grep -n -i lookup_term -- file_extension*

this command will print the matching lines for the term entered as parameter (case insensisitve) and optionally narrowing the search to certain file extension

✔️ **g.s.files** [lookup_term] [optional: file_extension]

❌ instead of *git grep -n  -ilookup_term*

❌ instead of *git grep -n -i lookup_term -- file_extension*

this command will print the matching lines for the term entered as parameter (case insensisitve) and optionally narrowing the search to certain file extension

## Task

✔️ **g.task** [task_name] ( Tab completion enabled )

allow you to easly run tasks you already created

✔️ **g.task.create** [task_name] ( Tab completion enabled )

this will create a new task (bash script) that you later could easily invoke with *g.task task_name*. this feature is recommended when you have common tasks that you usually run and want to have them scripted and accessible

✔️ **g.task.edit** [task_name] ( Tab completion enabled )

this will edit a task that you created with *g.task.create task_name*

✔️ **g.task.delete** [task_name] ( Tab completion enabled )

this will delete a task that you have created