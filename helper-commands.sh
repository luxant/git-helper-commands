#!/bin/sh

# load dependencies
source $(dirname -- ${BASH_ARGV[0]})/.dependencies.sh

# aliases
alias g.reload.cmds="
	source $G_HELPERS_SOURCE_DIR/helper-commands.sh &&
	_printInColor 'commands updated'
"

function _g_check_new_version() {
	# check on the remote repo which is the latest version of the tool
	local latest_version=$(_g_get_latest_version)
	local current_version=$(_g_get_default_value "current_tool_sha")

	_g_debug_print_in_color "latest_version: $latest_version current_version: $current_version"

	if [[ $latest_version != $current_version ]]
	then
		_printInColor "There is a ${G_EFFECT_BLINK}${G_COLOR_GREEN}new version${G_RESET_ALL} of the tool available"
		_printInColor "Do you want to download it?"
		_printInColor "Type yes/no (y/n):"
		read

		if [[ $REPLY == "yes" || $REPLY == "y" ]]
		then
			cd "$(dirname -- ${BASH_ARGV[0]})"

			echo
			_printInColor "Going to master branch" cyan
			echo

			git checkout master
			
			echo
			_printInColor "Fetching new version.." cyan
			echo

			git pull origin master

			_g_set_default_value "current_tool_sha" "${latest_version}"

			g.reload.cmds

			echo
			_printInColor "New version installed successfully :)" green
			echo
		fi
	fi
}

function _g_print_release_info() {

	_g_debug_print_in_color "@helper-commands.sh:_g_get_release"

	echo
	_printInColor "You have version $G_HELPERS_VERSION :)"
	echo

	local release_notes="$(awk -vRS='#### ' 'NR==2' $G_HELPERS_DOCS_RELEASE_NOTES)"

	echo "$release_notes"
	echo

	_printInColor 'To see full release notes go to https://bitbucket.org/luxancap/git-helper-commands/src/master/'

	echo
	_printInColor "    ༼ つ ◕_◕ ༽つ"
	echo
}

function _g_go_default() {

	_g_debug_print_in_color "@helper-commands.sh:_g_go_default"

	local default_directoy="$(_g_get_default_value go)"

	if [[ ! -z $default_directoy ]]
	then
		_printInColor "\ngoing to default location $default_directoy \r\n" cyan
		
		cd $default_directoy

		if [ $? -ne 0 ]
		then
			_printInColor "\ngoing to $default_directoy didn't worked, sorry\r\n" red
		fi
	fi
}

# go to the default configured location
alias g.go.default='_g_go_default'

###########################
#      Funciton calls     #
###########################

# print the promt for change log
_g_print_release_info

g.go.default

# we call the function that sets the promt text and color
PS1=$(set_prompt)

_g_check_new_version