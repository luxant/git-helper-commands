#################################
#       HELPER FUNCTIONS        #
#################################

# promt
function set_prompt ()
{
	local COLOR_DEFAULT='\[\e[0m\]'
	local COLOR_BLUE='\[\e[1;34m\]'
	local COLOR_GREEN='\[\e[1;32m\]'
	local COLOR_YELLOW='\[\e[1;33m\]'
#	echo "\u@${COLOR_BLUE}\h ${COLOR_GREEN}\W${COLOR_YELLOW}\$(__git_ps1)${COLOR_DEFAULT}\$ "
	echo "${COLOR_BLUE}\h ${COLOR_GREEN}\W${COLOR_YELLOW}\$(__git_ps1)${COLOR_DEFAULT}\$ "
}

function _g_map_color() {
	if [[ $1 == "red" ]]
	then
		# setterm -term linux -fore $1
		echo "${G_COLOR_RED}"
	elif [[ $1 == "blue" ]]
	then
		echo "${G_COLOR_BLUE}"
	elif [[ $1 == "yellow" ]]
	then
		echo "${G_COLOR_YELLOW}"
	elif [[ $1 == "cyan" ]]
	then
		echo "${G_COLOR_CYAN}"
	elif [[ $1 == "light_blue" ]]
	then
		echo "$G_COLOR_LIGTH_BLUE"
	elif [[ $1 == "light_magenta" ]]
	then
		echo "$G_COLOR_LIGTH_MAGENTA"
	elif [[ $1 == "white" ]]
	then
		echo "$G_COLOR_WHITE"
	elif [[ $1 == "green" ]]
	then
		echo "${G_COLOR_GREEN}"
	else
		echo "${G_RESET_ALL}"
	fi
}

function _printInColor() {
	local COLOR=$(_g_map_color $2)

	echo -e "${G_RESET_ALL}${COLOR}$1${G_RESET_ALL}";
};

function _g_debug_print_in_color() {
	if [[ -z $G_DEBUG ]]
	then
		return 0
	fi

	local COLOR=$(_g_map_color light_magenta)

	if [[ ! -z $2 ]]
	then
		COLOR=$(_g_map_color $2)
	fi

	echo -e "${G_RESET_ALL}${COLOR}$1${G_RESET_ALL}";
};

function _get_current_script_dir(){
	echo ${BASH_ARGV[0]%/*}
}

function _is_program_installed() {
	hash $1 &> /dev/null

	# we return (output) the hash exit code
	echo "$?"
}

function _g_get_latest_version() {
	local regex='{[[[:space:]]+"name":[[[:space:]]+"master",[[[:space:]]+"commit":[[[:space:]]+{[[[:space:]]+"sha":[[[:space:]]+"([0-9 a-z A-Z]+)';

	# get master branch current commit for the git-helper-commands repo
	local result=$(curl -s --location --request GET 'https://api.github.com/repos/luxant/git-helper-commands/branches/master')

	# evaluate request response agains the regex expresion
	[[ "$result" =~ $regex ]]

	echo "${BASH_REMATCH[1]}"
}