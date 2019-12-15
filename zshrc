########
# PATH #
########
export PATH=$HOME/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin


#######
# ZSH #
#######
export ZSH_CUSTOM=${HOME}/.zsh/custom
export ZSH=$HOME/.zsh/oh-my-zsh
unsetopt auto_cd

CASE_SENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="yyyy-mm-dd"

##################
# Local settings #
##################
# Unset all LOCAL_* variables first 
unset $(echo $parameters[(I)LOCAL_*]) 2> /dev/null

# Load local configs
if [[ -e ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

#############
# ZSH Theme #
#############
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
DEFAULT_FG=${LOCAL_DEFAULT_FG:-"blue"}

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon host dir dir_writable vcs virtualenv)
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=" "

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="]# "

POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND=${DEFAULT_FG}

POWERLEVEL9K_HOST_TEMPLATE="%4m"
POWERLEVEL9K_HOST_ICON=${LOCAL_HOST_ICON:-""}
POWERLEVEL9K_HOST_LOCAL_FOREGROUND=${DEFAULT_FG}
POWERLEVEL9K_HOST_REMOTE_FOREGROUND=${DEFAULT_FG}
POWERLEVEL9K_SSH_ICON="ﳣ"


POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=${DEFAULT_FG}
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_BACKGROUND=${DEFAULT_FG}
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=${DEFAULT_FG}
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_VCS_CLEAN_BACKGROUND="white"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="blue"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="magenta"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="white"
POWERLEVEL9K_VCS_ACTIONFORMAT_BACKGROUND="red"
POWERLEVEL9K_VCS_ACTIONFORMAT_FOREGROUND="white"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="cyan"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="white"
POWERLEVEL9K_SHOW_CHANGESET=true

POWERLEVEL9K_VIRTUALENV_FOREGROUND="white"
POWERLEVEL9K_VIRTUALENV_BACKGROUND="green"

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=" " 

POWERLEVEL9K_TIME_FOREGROUND="white"
POWERLEVEL9K_TIME_BACKGROUND=${DEFAULT_FG}
#######

###########
# Plugins #
###########
plugins=(
  extip
  git
  mercurial
  rust
  virtualenv
  virtualenvwrapper 
  tmux
)

##########
# Python #
##########
export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
alias python='python3'

# Virtual env
if [ -n "${VIRTUAL_ENV}" ]; then
  . "${VIRTUAL_ENV}/bin/activate"
fi

#########
# Tools #
#########
alias make='gmake'
alias uuidgen='uuidgen | tr "[A-Z]" "[a-z]"'

########
# Tmux #
########
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_AUTOSTART=false

# Set a session name env var
if [[ -n "$TMUX" ]]; then
  export TMUX_SESSION_NAME="`tmux display -p '#S'`"
fi

##########
# Editor #
##########
export EDITOR=vim

# Load zsh
unsetopt AUTO_CD
source $ZSH/oh-my-zsh.sh
