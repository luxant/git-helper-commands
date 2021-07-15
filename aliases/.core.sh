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
	if [[ ! -z $G_DEBUG ]]
	then
		local COLOR=$(_g_map_color $2)

		echo -e "${G_RESET_ALL}${COLOR}$1${G_RESET_ALL}";
	fi
};

function _TEXT_ENCODE (){
	echo $(python -c "import urllib, sys; print urllib.quote(sys.argv[1])" "$1")
};

function _get_current_script_dir(){
	echo ${BASH_ARGV[0]%/*}
}

function _is_program_installed() {
	hash $1 &> /dev/null

	# we return (output) the hash exit code
	echo "$?"
}