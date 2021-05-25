# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kappcy/.oh-my-zsh"

# theme
ZSH_THEME="some_colors"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  autojump
  colored-man-pages
  zsh_reload
  zsh-vim-mode
  vundle
)

source $ZSH/oh-my-zsh.sh
source $HOME/.config/broot/launcher/bash/br

# User configuration

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR='vim'

export PATH=/home/kappcy/scripts/:$PATH
export GOPATH=/home/$USER/.go
export PATH=$PATH:$GOPATH/bin

# alias ls="exa -al --color=always --group-directories-first"
alias parsec="/usr/bin/parsecd app_daemon=1"
alias FreeFileSync="/opt/freefilesync/FreeFileSync"
alias fuck="killall -9"
alias neo="clear && echo -e '\n' && neofetch"
alias config-dots='/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME'
alias config-scripts='/usr/bin/git --git-dir=$HOME/git/scripts/ --work-tree=$HOME/scripts'

# vim thing
setopt PROMPT_SUBST
MODE_INDICATOR_VIINS='%F{4}>%f'
MODE_INDICATOR_VICMD='%F{5}>%f'
MODE_INDICATOR_REPLACE='%F{11}>%f'
MODE_INDICATOR_SEARCH='%F{5}>%f'
MODE_INDICATOR_VISUAL='%F{11}>%f'
MODE_INDICATOR_VLINE='%F{11}>%f'

# disable ctrl s being a thing
stty -ixon

local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
PS1="${current_dir}${rvm_ruby}${git_branch}${venv_prompt} %F{2}>%F{7}>${MODE_INDICATOR_PROMPT}%f %"
RPS1="%F{7}%D{%m/%d/%y,%H:%M:%S}%f"

