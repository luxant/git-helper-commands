#********************************
#*  LOAD DEPENDENCIES   *
#********************************

# load core funcions used in may places
source $(dirname -- ${BASH_ARGV[0]})/aliases/.core.sh

# constants and global variables
_g_debug_print_in_color "Loading global variables"
source $(dirname -- ${BASH_ARGV[0]})/.global-variables.sh
_g_debug_print_in_color "Finished loading global variables\n"

# load helper functions used in some commands
_g_debug_print_in_color "Loading git-completion"
source $(dirname -- ${BASH_ARGV[0]})/external/.git-completion.sh
_g_debug_print_in_color "Finished loading git-completion"

# load helpers
_g_debug_print_in_color "Loading helpers"
source $(dirname -- ${BASH_ARGV[0]})/aliases/.helpers.sh
_g_debug_print_in_color "Finished loading helpers"

# custom task that are user defined
_g_debug_print_in_color "Loading tasks"
source $(dirname -- ${BASH_ARGV[0]})/aliases/.tasks.sh
_g_debug_print_in_color "Finished loading tasks"

# git
_g_debug_print_in_color "Loading git commands"
source $(dirname -- ${BASH_ARGV[0]})/aliases/.git.sh
_g_debug_print_in_color "Finished loading git commands"