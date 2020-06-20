#!/bin/sh

# load dependencies
source $(dirname -- ${BASH_ARGV[0]})/.dependencies.sh

# aliases
alias g.reload.cmds="
	source $G_HELPERS_SOURCE_DIR/helper-commands.sh &&
	_printInColor 'commands updated'
"

# alias get.help='nano -v $CMDS_HELP'
alias g.get.release='g_get_release'

function g_get_release() {

	echo ''

	_printInColor "You got a new version $G_HELPERS_VERSION :)"

	echo ''

	local release_notes="$(awk -vRS='#### ' 'NR==2' $G_HELPERS_DOCS_RELEASE_NOTES)"

	echo "$release_notes"

	echo ''

	_printInColor 'To see full release notes go to https://bitbucket.org/luxancap/git-helper-commands/src/master/'

	echo ''

	_printInColor "    ༼ つ ◕_◕ ༽つ"

	echo ''
}

function g_go_default() {

	local default_directoy=$(g_get_default_value go)

	if [[ ! -z $default_directoy ]]
	then
		_printInColor "\ngoing to default location $default_directoy \r\n"
		
		cd $default_directoy
	fi
}

# go to the default location configure
alias g.go.default='g_go_default'

# print the promt for change log
g.get.release

g.go.default

# we call the function that sets the promt text and color
PS1=$(set_prompt)
