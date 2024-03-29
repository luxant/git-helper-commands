#################################
#		GIT		#
#################################

alias g.st='git status'
alias g.st.untracked='git status -u'
alias g.lg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative --date-order'
alias g.ck='git checkout '
alias g.ck.file='function g_ck_file() {
	local branch=$(g_get_default_branch)

	if [[ ! -z $1 ]]; then
		branch=$1
	fi

	git checkout origin/$branch -- $2
}; g_ck_file '
alias g.add='git add '
alias g.co='_commit '
alias g.co.anyway='function _commit_anyway(){
	#we check if there was any invalid code
	_printInColor "I hope you are not commiting console.logs under the hood ~(✖_✖)~" yellow

	git commit -m "$@"
}; _commit_anyway '
alias g.amend.message='git commit --amend --cleanup=whitespace'
alias g.amend.changes='git commit --amend --no-edit'
alias g.fetch='git fetch $G_GIT_REMOTE_NAME '

alias g.diff='git diff --patience '
alias g.diff.without.spaces='git diff --patience --ignore-space-at-eol '
alias g.diff.raw='git diff '
alias g.diff.staged='git diff --staged '
alias g.diff.hash='function _git_diff_hash(){

	if [[ ! -z $1 ]]; then
		git diff $1^ $1
	else
		git diff HEAD^ HEAD
	fi
}; _git_diff_hash '

alias g.revert.untrack='git clean -fd'
alias g.revert.staged='git reset'
alias g.revert.all='
	_printInColor "Reverting:"

	_printInColor "abort merge..."

	git merge --abort

	_printInColor "tracked files..."
	
	g.ck .

	_printInColor "untracked files..."
	
	g.revert.untrack
'
alias g.cherry-pick='_cherry_pick '
alias g.cherry-pick.range='function _cherry_pick_range(){
	git cherry-pick $1^..$2
}; _cherry_pick_range '
alias g.cherry-pick.abort='git cherry-pick --abort'
alias g.cherry-pick.continue='git cherry-pick --continue '

alias g.branch='git branch '
alias g.branch.create='git branch  '
alias g.branch.delete='git branch -D '
alias g.branch.rename='git branch -m '
alias g.branch.prune='_g_branch_prune '

alias g.stash='git stash '
alias g.stash.save='git stash save '
alias g.stash.pop='git stash pop '
alias g.stash.drop='git stash drop '
alias g.stash.apply='git stash apply '
alias g.stash.untracked='git stash --include-untracked '

alias g.merge.abort='git merge --abort '
alias g.merge.resolve.theirs='git merge -X theirs '

alias g.pull='_pull_rebase '
alias g.pull.raw='g_pull '
alias g.pull.rebase='_pull_rebase '

alias g.push='function _push(){
	_printInColor "Pushing to $(g_get_default_branch)"
	git push origin $(g_get_default_branch)
}; _push '
alias g.push.force='function _push_force(){
	local branch=$(g_get_default_branch)

	_printInColor "Pushing --force to origin/$branch" yellow

	git push --force origin $branch
}; _push_force '

alias g.rebase.abort='git rebase --abort'
alias g.rebase.continue='git rebase --continue'

alias g.reset='git reset '
alias g.reset.soft='git reset --soft '
alias g.reset.hard='git reset --hard '
alias g.reset.commit='git reset --soft HEAD~1'
alias g.reset.remote='function _reset_remote(){

	local branch=$(g_get_default_branch $1)

	_printInColor "Fetching $G_GIT_REMOTE_NAME/$branch"

	g.fetch $branch

	_printInColor "Reseting branch to $G_GIT_REMOTE_NAME/$branch HEAD" yellow

	git reset --hard $G_GIT_REMOTE_NAME/$branch

}; _reset_remote '

alias g.s='function _s(){ 

	#checks if were recibed more than 1 parameter
	if [[ $# -gt 1 ]]
	then
		_printInColor "Searching for \"$1\" in *.$2 files...";
		git grep -n "$1" -- *."$2";
		_printInColor "Matches of \"$1\" in *.$2 files";
	else
		_printInColor "Searching for \"$@\" in ALL files...";
		git grep -n "$@";
		_printInColor "Matches of \"$@\" in ALL files";
	fi
}; _s '
alias g.s.ignore.case='function _s_ignore_case(){

	#checks if were recibed more than 1 parameter
	if [[ $# -gt 1 ]]
	then
			_printInColor "Searching for \"$1\" with flags -i in *.$2 files...";
			git grep -n -i "$1" -- *."$2";
			_printInColor "Matches of \"$1\" with flags $1 in *.$2 files";
	else
			_printInColor "Searching for \"$@\" in ALL files...";
			git grep -n -i "$@";
			_printInColor "Matches of \"$@\" in ALL files";
	fi

}; _s_ignore_case '

#################################
#	   FUNCTIONS	        #
#################################

function _commit(){
	#                                 ,-
	#                                //
	#                               /:      ,
	#                              ;.(     //
	#                    |   ,     /`|    //
	#                    |\  |\    |,|   //
	#                 |  (\  (\    |`|   |(
	#                 (\  \\  \\   |,|   ;|
	#             .   ||   \\  \\  |`(   ;(
	#             \\   \\  \\  \\  |.\\  ((
	#              \\   \\  \\  \\  \\ \;/:\
	#                \\  \\  \'. \\_,\\ /\""-._
	#                 \\  \\  \ \-"   \/ `;._ ".
	#                ___\\-\\-" \ \_  /,  |_ "._\
	#          _,--""___ \ \,_   "-_"- |".|(._ ".".-.
	#      _,-"_,--"""__ ) "."-_    "--\ \"("o\_\ "- ".
	#    ,",-""" _.-'''_-"   "-_"-.__   \ \_\_//\)__"\_)
	#  ,"    ',-'  ,-""   7"  _ "-.._""_>\__`""'"__ ""``-._
	#         ;  ," ,-",'/` ,":\.    `   `  `"""___`""-._  ".   )
	#         ;,"_," ,' /`,"}}::\\         `... \____''' "\  '.|\
	#        ,","   :  /`/{{)/:::"\__,---._    \  \_____'''\    \
	#       , ,"_  ;  /`/ ///::::::::' ,-"-\    \__   \____''\ \ \
	#      ,,"   `;| ";; /}}/::'``':::(._``."-.__  """--    '_\ \ \
	#     ('       ;// / {;;:'`````':; /`._."""  ""-.._ `"-. " (   )
	#     /         )(/ <";"'``   ``/ /_.(             "_  "-_"\`);
	#               (/ <";"``     `/ /`,(                "._ _".\;
	#                |<";"`   ``  / /"-"   ctr              "
	#                <";"` ``    / /__,;
	#
	# Do not move the following line, the exit status code of '_commit_code_check'
	# like this: local grep_output=$(_commit_code_check), grep_exit_code=$?;
	# has to be done in the same line as the inner command $(inner_command)
	# or the local keyword (which is a command itself) will overwrite it
	local grep_output="$(_commit_code_check)" grep_exit_code=$?;

	#we check if there was any invalid code
	if [ $grep_exit_code -eq 1 ]
	then
		echo
		_printInColor "It seem you may have some invalid staments, take a look a this:" red
		echo
		echo "$grep_output"
		echo
		_printInColor "If you are sure this isn't yours (not my fault/pilatazo), do a 'g.co.anyway'"
	else
		git commit -m "$@"
	fi
}

function _commit_code_check(){

	local patterns=(
		 'console.log('
		 'print_r('
		 '[tT][oO]-*[dD][oO]'
		 '<<<'
		 '>>>'
		 '===='
		 'var_dump'
		 'echo '
		 'alert('
		 'die()'
		 )

	#concatenate search patterns in a grep requiered regex string
	local pattern_text="$( printf '\|%s'  ${patterns[*]} )"

	#removes first separator apppended at the beginning of search regex
	#cause it ends up like this: ,a,b,c
	pattern_text=${pattern_text:2}

	git diff --staged --name-only | xargs -d '\n' grep -n "$pattern_text" /dev/null

	#we check the grep status code
	if [ $? -eq 0 ]
	then
		#the code has invalid statements
		return 1
	else
		#the code is fine
		return 0
	fi
}

function _cherry_pick() {

	git cherry-pick $1

	if [[ $? != 0 ]]; then

		echo
		_printInColor  "cherry-pick failed!!! :(" red
		echo

		g.st
	fi
}

function g_pull(){

	local branch=$(g_get_default_branch $1)

	_printInColor "Fetching $G_GIT_REMOTE_NAME"

	git fetch $G_GIT_REMOTE_NAME

	_printInColor "Pulling $G_GIT_REMOTE_NAME/$branch"

	git pull $G_GIT_REMOTE_NAME $branch

	if [[ $? != 0 ]]; then

		echo
		_printInColor "      ^     " red
		_printInColor "     / \    " red
		_printInColor "    /   \   " red
		_printInColor "   /     \  " red
		_printInColor "  /       \ " red
		_printInColor "  --.   .-- " red
		_printInColor "    |   |   " red
		_printInColor "    |   |   " red
		_printInColor "    |   |   " red
		_printInColor "    |   |   " red
		_printInColor "    |   |   " red
		_printInColor "     ---    " red

		_printInColor  "Pull failed!!! :(" red
		echo
	fi

	_printInColor "Showing status"

	g.st
};

function _pull_rebase (){

	local branch=$(g_get_default_branch $1)

	_printInColor "Fetching $G_GIT_REMOTE_NAME"

	git fetch $G_GIT_REMOTE_NAME

	_printInColor "Pulling and rebasing $G_GIT_REMOTE_NAME/$branch" yellow

	git pull --rebase $G_GIT_REMOTE_NAME $branch

	if [[ $? != 0 ]]; then

		echo
		_printInColor "      ^     " red
		_printInColor "     / \    " red
		_printInColor "    /   \   " red
		_printInColor "   /     \  " red
		_printInColor "  /       \ " red
		_printInColor "  --.   .-- " red
		_printInColor "    |   |   " red
		_printInColor "    |   |   " red
		_printInColor "    |   |   " red
		_printInColor "    |   |   " red
		_printInColor "    |   |   " red
		_printInColor "     ---    " red

		_printInColor  "Rebase failed!!! :(" red
		echo
	fi

	_printInColor "Showing status"

	g.st
};

function _g_branch_prune (){
    local checkmark_icon='\u2714' # \xE2\x9C\x94
    local cross_icon='\u274c'

	local current_branch=$(g_get_default_branch)

    # array of branches that we shouldn't delete
    local keep_branches=("$current_branch $G_GIT_KEY_BRANCHES")

    _printInColor "${G_COLOR_GREEN}keeping branches$G_RESET_ALL: $keep_branches"

    # get local branches. sed will remove the * of the current
    # and put all branch names in a single line
    local local_branches=($(git branch | sed -z 's/[\n|\*]/ /g'))

    _printInColor "${G_COLOR_CYAN}local branches$G_RESET_ALL: ${local_branches[*]}"

    echo

    local kept_branches=()
    local deleted_branches=()

    for branch in ${local_branches[*]}
    do
        _g_debug_print_in_color "branch being evaluated: $branch"

        # check if the branch is not a keep branch
        if [[ ! " ${keep_branches[*]} " =~ " ${branch} " ]]; then

            deleted_branches+=("$branch")

            # whatever you want to do when array doesn't contain value
            git branch -D "$branch"
        else
            kept_branches+=("$branch")
        fi
    done

    echo 
    _printInColor "---------------------" cyan
    _printInColor "branch pruning result" cyan
    _printInColor "---------------------" cyan
    echo 

    _printInColor "kept branches:" green
    
    for branch in ${kept_branches[*]}
    do
        _printInColor "- $branch"
    done

    echo 

    _printInColor "deleted branches:" red
    
    for branch in ${deleted_branches[*]}
    do
        _printInColor "- $branch"
    done
}

function g_get_default_branch(){
	local branch="$(git branch | grep \* | cut -d ' ' -f2)";

	if [ ! -z $1 ]
	then
		branch=$1
	fi

	echo $branch
}


_git_status_completer() {
	local cur prev opts
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	opts="$(git status --porcelain | sed 's/[M?]//g')"

	if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
		COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
		return 0
	fi
}

_default_completer() {
	local cur prev opts
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	opts="$(__git_heads)"

	if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
		COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
		return 0
	fi

#	case "${prev}" in
		# ...
#	esac
}

#configurations of which funcion will be used to help complete commands params
complete -F _default_completer g.pull
complete -F _default_completer g.pull.raw
complete -F _default_completer g.ck
complete -F _default_completer g.branch.delete
complete -F _default_completer g.pull.rebase
complete -F _default_completer g.branch.rename
complete -F _default_completer g.reset.remote

complete -F _default_completer g.cherry-pick.to.branch

complete -F _git_status_completer g.add
complete -F _git_status_completer g.diff

complete -F _git_commit g.co
complete -F _git_cherry_pick g.cherry-pick
