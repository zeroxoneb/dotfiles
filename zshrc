# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

########
# PATH #
########
export PATH=$HOME/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin


#######
# ZSH #
#######
export ZSH=$HOME/.dotfiles/zsh/oh-my-zsh
export ZSH_CUSTOM=${HOME}/.dotfiles/zsh/custom
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
ZSH_THEME="powerlevel10k/powerlevel10k"
CONTEXT_ICON=${LOCAL_CONTEXT_ICON:-"ﴥ"}
DEFAULT_BG=${LOCAL_DEFAULT_FG:-"blue"}
DEFAULT_FG=${LOCAL_DEFAULT_BG:-"white"}

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs virtualenv)
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=""
POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="]# "

POWERLEVEL9K_CONTEXT_TEMPLATE="${CONTEXT_ICON} ${OS_ICON} %3m"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=${DEFAULT_BG}
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=${DEFAULT_FG}
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND=${DEFAULT_BG}
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND=${DEFAULT_FG}

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=${DEFAULT_FG}
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=${DEFAULT_BG}
POWERLEVEL9K_DIR_HOME_BACKGROUND=${DEFAULT_FG}
POWERLEVEL9K_DIR_HOME_FOREGROUND=${DEFAULT_BG}
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=${DEFAULT_FG}
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=${DEFAULT_BG}

POWERLEVEL9K_VCS_CLEAN_BACKGROUND="black"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="white"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="magenta"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="white"
POWERLEVEL9K_VCS_ACTIONFORMAT_BACKGROUND="red"
POWERLEVEL9K_VCS_ACTIONFORMAT_FOREGROUND="white"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="cyan"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="white"
POWERLEVEL9K_SHOW_CHANGESET=true

POWERLEVEL9K_VIRTUALENV_FOREGROUND="white"
POWERLEVEL9K_VIRTUALENV_BACKGROUND="green"

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
#######
#######

###########
# Plugins #
###########
plugins=(
  direnv
  extip
  git
  # gpg-agent
  mercurial
  python
  rust
  # virtualenv
  # virtualenvwrapper 
  tmux
  uuidgen
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
if [[ "${OSTYPE}" == darwin* ]]; then
  plugins+=()
fi

########
# Tmux #
########
ZSH_TMUX_AUTOQUIT=${LOCAL_ZSH_TMUX_AUTOQUIT:-false}
ZSH_TMUX_AUTOSTART=${LOCAL_ZSH_TMUX_AUTOSTART:-false}

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
