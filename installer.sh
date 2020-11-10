#!/bin/sh

source $(dirname -- ${BASH_ARGV[0]})/.global-variables.sh
source $(dirname -- ${BASH_ARGV[0]})/aliases/.core.sh


function g_create_working_folders() {

	_printInColor "Creating work files and folders at $G_HELPERS_FILES_BASE_DIR"

	mkdir -p "$G_DEFAULTS_SCRIPTS_DIR"
	mkdir -p "$G_TASKS_SCRIPTS_DIR"
	
	touch -a "$G_DEFAULTS_SCRIPTS_FILE" # default values file creaation

	_printInColor "Finished creating work files and folders\n"
}

function g_installing_helper_commands_loading() {

	local source_path="$(pwd $(dirname -- ${BASH_ARGV[0]}))/helper-commands.sh"

	# load extending commands
	if [[ -z $(grep "^ *source \+$source_path" "$G_HELPERS_ENTRY_SCRIPT") ]] # Note: \+ means match spaces for grep
	then
		_printInColor "Installing commands..."

		# write the commands loading to the .bash_profile script
		echo "" >> "$G_HELPERS_ENTRY_SCRIPT"
		echo "# load helper commands" >> "$G_HELPERS_ENTRY_SCRIPT"
		echo "source $source_path" >> "$G_HELPERS_ENTRY_SCRIPT"

		_printInColor "Finished installation\n"

		# create folders and files used by the library
		g_create_working_folders

		_printInColor "Loading commands..."

		source "$source_path"

		_printInColor "Finished loading commands\n"

		_printInColor "Install success :)" green
	else
		_printInColor "It seems the commands are already installed :)" green
	fi
}

# execute the installation
g_installing_helper_commands_loading