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

function _printInColor(){

	if [[ ! -z $2 ]]
	then
		_setColor $2
	else
		_setColor cyan
	fi

	echo -e "$1";

	_setColor white

};

function _setColor(){
	if [[ ! -z $(command -v setterm) ]]
	then
		setterm -term linux -fore $1
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