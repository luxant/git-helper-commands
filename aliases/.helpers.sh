#linux 
alias ll='ls -l'
alias la='ls -al'

#search
alias g.s.system='function g_s_system(){
	_printInColor "Searching */$@...";
	find . -name "$@"
}; g_s_system '

alias g.run_command_n_times='g_run_command_n_times '

#########################
# The command line help #
#########################
function g_display_help {
	echo
	_printInColor "Script run N times a command"
	echo
	echo "Usage: g_run_command_n_times [cmd] [n]"
	echo
	echo "    cmd: Command"
	echo "    n:   Number of times to execute the command"
	echo
	echo "Example 1: g_run_command_n_times 'echo something' 3"
	echo
	echo "Example 2: g_run_command_n_times 'ls -la' 3"
	echo

	return 0;
}

#######################
# Run command N times #
#######################
function g_run_command_n_times {

	# Validate the cli arguments received
	if [ $# -gt 0 ]; then
		if [ "$1" == "" ] || [ "$2" == "" ]; then
			_printInColor "Error: Missed argument(s)" red

			g_display_help

			return 0
		fi
	else
		_printInColor "Error: You must input the arguments" red

		g_display_help

		return 0
	fi

	echo
	_g_debug_print_in_color "Running command: '$1' $2 times"
	echo

	for ((i=1; i<=$2; i++))
	do
		_printInColor "Run # ${i}"
		$1
		echo
	done

	_g_debug_print_in_color "Finished. Command run ${2} times" green
	echo
}

function _g_set_default_value() {

	# If the file or default doesn't exist yet
	if [[ ! -f "$G_DEFAULTS_SCRIPTS_FILE" || -z $(grep "^$1=.*" "$G_DEFAULTS_SCRIPTS_FILE") ]]
	then
		_printInColor "Defaulting: $1=$2"

		echo "$1=$2" >> "$G_DEFAULTS_SCRIPTS_FILE"

	# If the default doesn't exist yet
	else

		local scaped=$(echo $2 | sed 's/\//\\\//g')

		# replace the whole line with the proper value pair
		sed -i -E "s/^$1.*/$1=$scaped/g" "$G_DEFAULTS_SCRIPTS_FILE"
	fi
}

function _g_get_default_value() {

	local key_value=

	if [[ -f "$G_DEFAULTS_SCRIPTS_FILE" ]]
	then
		key_value=$(grep "^$1=" "$G_DEFAULTS_SCRIPTS_FILE")
	else
		return 0;
	fi

	# If the default doesn't exist yet
	if [[ ! -z "$key_value" ]]
	then
	# If the default doesn't exist yet split by =
		echo "$(echo $key_value | cut -d'=' -f2)"
	fi
}


alias g.default.go='_g_set_default_value go '