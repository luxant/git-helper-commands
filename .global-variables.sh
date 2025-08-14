#################################
#       BASIC VARIABLES         #
#################################
# debug flag. Uncomment to get debug messages
# G_DEBUG=1

# variables
G_HELPERS_VERSION='1.2.2'

# console entry point
G_HELPERS_ENTRY_SCRIPT="$HOME/.bash_profile"

# where tasks and other files can be created
G_HELPERS_FILES_BASE_DIR="$HOME/.git-helper-commands-files"

# base dir of the project
G_HELPERS_SOURCE_DIR=$(dirname -- ${BASH_ARGV[0]})

# project release notes path
G_HELPERS_DOCS_RELEASE_NOTES="$G_HELPERS_SOURCE_DIR/CHANGELOG.md"


#################################
#       GIT VARIABLES           #
#################################

# Set here the name of your remote as needed
G_GIT_REMOTE_NAME='origin'
G_GIT_KEY_BRANCHES='master developer develop stage main release production prod'

#################################
#       TASK VARIABLES          #
#################################

G_TASKS_SCRIPTS_DIR="$G_HELPERS_FILES_BASE_DIR/tasks"

#################################
#       DEFAULTS VARIABLES      #
#################################

G_DEFAULTS_SCRIPTS_DIR="$G_HELPERS_FILES_BASE_DIR/default"
G_DEFAULTS_SCRIPTS_FILE="$G_DEFAULTS_SCRIPTS_DIR/.value-pairs.txt"


#################################
#            COLOR              #
#################################
G_RESET_ALL='\e[0m'
G_COLOR_DEFAULT='\e[39m'
G_COLOR_BLUE='\e[34m'
G_COLOR_GREEN='\e[32m'
G_COLOR_YELLOW='\e[33m'
G_COLOR_CYAN='\e[36m'
G_COLOR_RED='\e[31m'
G_COLOR_WHITE='\e[97m'
G_COLOR_LIGTH_BLUE='\e[94m'
G_COLOR_LIGTH_MAGENTA='\e[95m'

#################################
#         TEXT EFFECTS          #
#################################
G_EFFECT_BLINK='\e[5m'