# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/somno/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

export DEFAULT_USER="fernando"
export TERM="xterm-256color"
export ZSH=/usr/share/oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
source $ZSH/themes/powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_FOLDER_ICON=""
POWERLEVEL9K_HOME_SUB_ICON="$(print_icon "HOME_ICON")"
POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print_icon "LEFT_SUBSEGMENT_SEPARATOR") "

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true

POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='black'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='178'
POWERLEVEL9K_NVM_BACKGROUND="238"
POWERLEVEL9K_NVM_FOREGROUND="green"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="blue"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="015"

POWERLEVEL9K_TIME_BACKGROUND='255'
#POWERLEVEL9K_COMMAND_TIME_FOREGROUND='gray'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='245'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time time)
POWERLEVEL9K_SHOW_CHANGESET=true

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
# /!\ do not use with zsh-autosuggestions

# plugins=(archlinux asdf bundler docker jsontools 	vscode web-search	k tig gitfast	colored-man-pages	colorize 	command-not-found cp dirhistory autojump sudo zsh-syntax-highlighting)
# /!\ zsh-syntax-highlighting and then zsh-autosuggestions must be at the end

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[cursor]='bold'

ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green,bold'

rule () {
	print -Pn '%F{blue}'
	local columns=$(tput cols)
	for ((i=1; i<=columns; i++)); do
	   printf "\u2588"
	done
	print -P '%f'
}

function _my_clear() {
	echo
	rule
	zle clear-screen
}
zle -N _my_clear
bindkey '^l' _my_clear

# Ctrl-O opens zsh at the current location, and on exit, cd into ranger's last location.
ranger-cd() {
	tempfile=$(mktemp)
	ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
	test -f "$tempfile" &&
	if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
	cd -- "$(cat "$tempfile")"
	fi
	rm -f -- "$tempfile"
	# hacky way of transferring over previous command and updating the screen
	VISUAL=true zle edit-command-line
}
zle -N ranger-cd
bindkey '^o' ranger-cd

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# clone antidote if necessary
if ! [[ -e ${ZDOTDIR:-~}/.antidote ]]; then
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi

# source antidote and load plugins from `${ZDOTDIR:-~}/.zsh_plugins.txt`
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load


source $ZSH/oh-my-zsh.sh

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

clear
meowfetch
