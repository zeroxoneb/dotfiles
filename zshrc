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
# POWERLEVEL10K_MODE='nerdfont-complete'
#######

###########
# Plugins #
###########
plugins=(
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

[[ ! -f ~/.dotfiles/p10k.zsh ]] || source ~/.dotfiles/p10k.zsh
