#********************************
#*  LOAD DEPENDENCIES   *
#********************************

# constants and global variables
source $(dirname -- ${BASH_ARGV[0]})/.global-variables.sh

# load helper functions used in some commands
source ${BASH_ARGV[0]%/*}/external/.git-completion.sh

# load core funcions used in may places
source ${BASH_ARGV[0]%/*}/aliases/.core.sh

# load helpers
source ${BASH_ARGV[0]%/*}/aliases/.helpers.sh

# custom task that are user defined
source ${BASH_ARGV[0]%/*}/aliases/.tasks.sh

# git
source ${BASH_ARGV[0]%/*}/aliases/.git.sh