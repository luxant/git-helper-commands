## Legends

β commands that I suggest you to check out that I consider most useful in a day to day work :)

βοΈ what the tools suggest to use

β *raw command* you would have to run instead

# Git πΎ

## Most used cmds for git

ββοΈ **g.st**

β instead of *git status*

show the status of the repository

βοΈ **g.st.untracked**

β instead of *git status -u*

show the status of the repository including untracked files

ββοΈ **g.lg**

β instead of *git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative --date-order*

show the log of the repository

ββοΈ **g.ck** [file_path | directory_path] ( Tab completion enabled )

β instead of *git checkout*

alias for the git checkout

ββοΈ **g.add** [file_path | directory_path] ( Tab completion enabled )

β instead of *git add*

alias for the git add

ββοΈ **g.co** [message]

β instead of *git commit -m* message

ββοΈ **g.amend.changes**

β instead of *git commit --amend --no-edit*

this command has the same effects that git commit βamend βno-edit meaning it will append your staged changes to the HEAD commit of your branch without needing to commit or adding a message

ββοΈ **g.amend.message** [commit_message]

β instead of *git commit --amend --cleanup=whitespace*

helps update the message of a commit

ββοΈ **g.fetch**

β instead of *git fetch origin*

will fetch from $G_GIT_REMOTE_NAME (default: origin)

ββοΈ **g.diff** [optional: file_path] ( Tab completion enabled )

β instead of *git diff --patience*

## Git pull and push

ββοΈ **g.pull** [optional: branch_name] ( Tab completion enabled )

β instead of *git fetch origin*

β instead of *git pull --rebase origin your_brach*

β instead of *git status*

pull from the remote branch (at $G_GIT_REMOTE_NAME) received as parameter, but if none is given the local current branch name is used by default. This command will automatically:

1. fetch from upstream before pull,
2. then pull after that
3. and then it will show the status of your current branch

**NOTE:** g.pull uses *git pull --rebase*, is you want just to use *git pull* use g.pull.raw

ββοΈ **g.push**

β instead of *git push origin your_branch*

changes committed to the current branch are uploaded to your configured remote ($G_GIT_REMOTE_NAME). The local branch name is used as the new origin branch

ββοΈ **g.push.force**

β instead of *git push --force origin your_branch*

changes committed to the current branch are force uploaded to $G_GIT_REMOTE_NAME (default: origin). The local branch is used as the new origin branch

## Diff

βοΈ **g.diff.without.spaces** [optional: file_path]

β instead of *git diff --patience --ignore-space-at-eol*

make a git diff ignoring white spaces

βοΈ **g.diff.raw** [optional: file_path]

β instead of *git diff --patience --ignore-space-at-eol*

make a git diff ignoring white spaces

βοΈ **g.diff.staged** [optional: file_path]

β instead of *git diff --staged*

makes a diff of a staged file

βοΈ **g.diff.hash** [optional: commit_num]

β if you don't supply commits this will work instead of *git diff HEAD^ HEAD* or *git diff commit1^ commit2*

show the changes made by a commit, but if no parameter is given HEAD commit is used instead

## Git revert

βοΈ **g.revert.untrack**

β instead of *git clean -fd*

revert changes made on untracked files

βοΈ **g.revert.staged**

β instead of *git reset*

revert changes made on staged files

βοΈ **g.revert.all**

β instead of *git merge --abort*

β instead of *git checkout .*

β instead of *git clean -fd*

revert changes made on any kind of file: tracked, untracked and merge conflicts.

## Git cherry-pick

ββοΈ **g.cherry-pick** [commit_num]

β git cherry-pick commit_nul

cherry-pick a commit to the current branch

βοΈ **g.cherry-pick.range** [old_commit_num] [newest_commit_num]

β instead of *git cherry-pick $1^..$2*

g.cherry-pick a range of commits to the current branch

ββοΈ **g.cherry-pick.abort**

β instead of *git cherry-pick --abort*

abort the current cherry-pick operation

ββοΈ **g.cherry-pick.continue**

β instead of *git cherry-pick --continue*

go ahead and continue with the current cherry-pick operation

## Git branch

ββοΈ **g.branch**

β instead of *git branch*

list the current branches of the repository

ββοΈ **g.branch.rename** [new_branch_name] ( Tab completion enabled )

β instead of *git branch -m new_name*

If you need to rename a branch

ββοΈ **g.branch.delete** ( Tab completion enabled )

β instead of *git branch -D branch_name*

deletes the branches given as parameter

ββοΈ **g.branch.prune**

β instead of *git branch -D branch_name*

run this command when you want to clean up your workspace of old branches. this will delete all the branches except some "famous" ones like *master*, *stage*, *developer*, *develop*, *production* or *main*

## Git stash

ββοΈ **g.stash** [optioanl: stash_name]

β instead of *git stash*

save the current changes of the branch in the stash

ββοΈ **g.stash.pop**

β instead of *git stash pop*

recover the last saved state from the stash

βοΈ **g.stash.drop**

β instead of *git stash drop*

delete the last saved state from the stash

ββοΈ **g.stash.apply**

β instead of *git stash apply*

applies the lastest stash to the current directory

βοΈ **g.stash.untracked**

βgit stash --include-untracked

this will include unstracked files in the stash being done

## Git merge

βοΈ **g.merge.abort**

β instead of *git merge --abort*

βοΈ **g.merge.resolve.theirs**

β instead of *git merge -X theirs*

## Git rebase

ββοΈ **g.rebase.abort**

β instead of *git rebase --abort*

ββοΈ **g.rebase.continue**

β instead of *git rebase --continue*

## Git reset

ββοΈ **g.reset** 

β instead of *git reset*

βοΈ **g.reset.soft** 

β instead of *git reset --soft*

βοΈ **g.reset.hard**

β instead of *git reset --hard*

ββοΈ **g.reset.remote** [optional: remote_branch_name]

β instead of *git reset --hard $G_GIT_REMOTE_NAME/$branch*

`remote_branch_name` default to your current branch name

this command will take the supplied branch name or the current workspace one as reference to reset the actual branch equal to the remote branch. β οΈ*you may lose your local changes so stash them first*β οΈ

## Search utilities

βοΈ **g.s** [lookup_term] [optional: file_extension]

β instead of *git grep -n lookup_term*

β instead of *git grep -n lookup_term -- file_extension*

this command will print the matching lines for the term entered as parameter and optionally narrowing the search to certain file extension

βοΈ **g.s.ignore.case** [lookup_term] [optional: file_extension]

β instead of *git grep -n  -ilookup_term*

β instead of *git grep -n -i lookup_term -- file_extension*

this command will print the matching lines for the term entered as parameter (case insensisitve) and optionally narrowing the search to certain file extension

βοΈ **g.s.files** [lookup_term] [optional: file_extension]

β instead of *git grep -n  -ilookup_term*

β instead of *git grep -n -i lookup_term -- file_extension*

this command will print the matching lines for the term entered as parameter (case insensisitve) and optionally narrowing the search to certain file extension

## Miscellaneous utilities

ββοΈ **g.default.go** [optioal: folder_path]

`folder_path` default to the current path

in many case when doing app development, we will have to remaing a good amount of time, days o even always using the repository. This implies that every new console I open I have to navigate to my working directory, but what if could set up a default directory so every time I open a new terminal I will land there automagically? this command will do exactly that

to use it just navigate to the desired default path and run it there or supply your desired folder path

βοΈ **ll**

β instead of *ls -l*

ββοΈ **la**

β instead of *ls -al*

βοΈ **g.run_command_n_times** [cmd] [n]

this will run the command you specify in `cmd` and will run it by `n` times

## Task

βοΈ **g.task** [task_name] ( Tab completion enabled )

allow you to easly run tasks you already created

βοΈ **g.task.create** [task_name] ( Tab completion enabled )

this will create a new task (bash script) that you later could easily invoke with *g.task task_name*. this feature is recommended when you have common tasks that you usually run and want to have them scripted and accessible

βοΈ **g.task.edit** [task_name] ( Tab completion enabled )

this will edit a task that you created with *g.task.create task_name*

βοΈ **g.task.delete** [task_name] ( Tab completion enabled )

this will delete a task that you have created