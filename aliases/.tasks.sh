#tasks
alias g.task='function g_task(){

	if [[ -z $1 ]]
	then
		_printInColor "Please enter a name for the task" red

		return 1
	fi

	local task_file=""
	local custom_location="$G_TASKS_SCRIPTS_DIR/$1.sh"

	if [[ -e $custom_location ]] #we check if the file exist in the user custom tasks
	then
		task_file=$custom_location
	else
		_printInColor "The task \"$1\" could not be found as:" red
		_printInColor $custom_location red

		return 1
	fi

	_printInColor "Running file $task_file for task \"$1\""
	_printInColor ""

	source $task_file

	_printInColor ""
	_printInColor "Task completed" green

}; g_task '
alias g.task.create='function g_task_create(){

	if [[ $(_is_program_installed nano) = "1" ]]
	then
		_printInColor "It seems nano is not installed, try installing it" red

		return 1
	fi

	if [[ -z $1 ]]
	then
		_printInColor "Please enter a name for the task" red

		return 1
	fi

	#if task folder dont exist in the user home, we create it
	if [[ ! -e $G_TASKS_SCRIPTS_DIR ]]
	then
		mkdir -p $G_TASKS_SCRIPTS_DIR
	fi

	nano $G_TASKS_SCRIPTS_DIR/$1.sh

}; g_task_create '
alias g.task.delete='function g_task_delete(){

	if [[ -z $1 ]]
	then
		_printInColor "Please enter a name for the task" red

		return 1
	fi

	local task_file=$G_TASKS_SCRIPTS_DIR/$1.sh

	#we check if the task file exist
	if [[ ! -e $task_file ]]
	then
		_printInColor "This task dosent seem to exist" yellow

		return 1
	fi

	rm -f $task_file

	_printInColor "The task has been deleted"

	return 0

}; g_task_delete '


function g_tasks_files_completition(){
	local cur prev customs_task_opts opts
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"

	# possible task in the custom task folder
	if [[ -e $G_TASKS_SCRIPTS_DIR/ ]]
	then
		customs_task_opts=$( find $G_TASKS_SCRIPTS_DIR/ -name "*.sh" -printf "%f " )
	fi

	# we merge both default and custom suggestions
	opts="${customs_task_opts[@]}"

	# we remove the .sh extension of the task source files 'cause we just need the name
	opts=$( echo "${opts}" | sed -e 's/[.]sh//g' )

	COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
};

# auto completition configuration
complete -F g_tasks_files_completition g.task
complete -F g_tasks_files_completition g.task.delete