#!/bin/sh

source $(dirname -- ${BASH_ARGV[0]})/.global-variables.sh
source $(dirname -- ${BASH_ARGV[0]})/aliases/.core.sh


function g_create_working_folders() {

	_printInColor "Creating work folders at $G_HELPERS_FILES_BASE_DIR"

	mkdir -p $G_DEFAULTS_SCRIPTS_DIR
	mkdir -p $G_TASKS_SCRIPTS_DIR
	
	touch -a $G_DEFAULTS_SCRIPTS_FILE # default values file creaation

	_printInColor "Finished creating work files and folders\n"
}

function g_installing_helper_commands_loading() {

	local source_path="$(dirname -- ${BASH_ARGV[0]})/helper-commands.sh"

	# load extending commands
	if [[ -z $(grep "^ *source \+$current_path" $G_HELPERS_ENTRY_SCRIPT) ]]
	then

		_printInColor "Installing commands..."

		echo "" >> $G_HELPERS_ENTRY_SCRIPT
		echo "#load helper commands" >> $G_HELPERS_ENTRY_SCRIPT
		echo "source $source_path" >> $G_HELPERS_ENTRY_SCRIPT

		_printInColor "Loading commands..."

		g_create_working_folders

		source "$source_path"

		_printInColor "Install success :)" green
	else
		_printInColor "It seems the commands are already installed :)" green
	fi
}

# execute the installation
g_installing_helper_commands_loading