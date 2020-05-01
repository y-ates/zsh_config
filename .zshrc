# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$(whoami)/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="pi"
ZSH_THEME="spaceship"

SPACESHIP_PHP_SYMBOL="PHP·"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git emacs zsh-autopair)

source $ZSH/oh-my-zsh.sh
#source $ZSH/plugins/calc.plugin.zsh/calc.plugin.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# User specific aliases and functions
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias fuck='sudo $(history -p \!\!)'
alias mailto="emailTo"
alias gc="chromium"
alias bt="wget http://cachefly.cachefly.net/100mb.test -O /dev/null"
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias tb="nc termbin.com 9999"
alias backup="/home/$(whoami)/Dokumente/Skripte/backup_stuff.sh"
alias am="autorandr mobile"
alias ad="autorandr docked"
alias dorph="sudo pacman -Rns $(pacman -Qtdq)"
alias ix="curl -F 'f:1=<-' ix.io"
#alias msfconsole="msfconsole --quiet -x \"db_connect msf_user@msf\""
alias d='dirs -v | head -10' # https://opensource.com/article/18/9/tips-productivity-zsh
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias startup_services="systemctl list-unit-files | grep enabled"
alias curltor="curl -Lx http://localhost:8118"
#alias ad="autorandr docked; xrandr --setprovideroutputsource 1 0; xrandr --output DVI-I-1-1 --left-of VGA1 --auto"
#alias ad="xrandr --output VGA1 --left-of LVDS1 --auto --primary; xrandr --setprovideroutputsource 1 0; xrandr --output DVI-I-1-1 --left-of VGA1 --auto"

function killp() {
	pgrep $1 | xargs kill
}

# Ordinary variables
uni=/msata/Dokumente/Master/5.Semester/
ma=/msata/Dokumente/Master/5.Semester/Masterarbeit/
GIT=~/Dokumente/GIT/
SVN=~/Dokumente/SVN/
msata=/msata

# Default editor
export EDITOR="emacsclient"
export VISUAL="emacsclient"
export PAGER="more"

# change ls colors
# https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
LS_COLORS=$LS_COLORS:'di=0;35:' ;

# Write email
emailTo(){
    thunderbird -compose "to=$1"
}

# compile latex
texbib() {
    pdflatex $1.tex && bibtex $1 && pdflatex $1.tex && pdflatex $1.tex
}

# calculator using bc 
c() { printf "%s\n" "$*" | bc -l}

# cd up to n dirs
# using:  cd.. 10   cd.. dir
function cd_up() {
	case $1 in
		*[!0-9]*)                                          # if no a number
			cd $( pwd | sed -r "s|(.*/$1[^/]*/).*|\1|" )     # search dir_name in current path, if found - cd to it
			;;                                               # if not found - not cd
		*)
			cd $(printf "%0.0s../" $(seq 1 $1));             # cd ../../../../  (N dirs)
			;;
	esac
}
alias 'cd..'='cd_up'                                # can not name function 'cd..'


# autoloads
autoload -Uz zcalc

# fix zsh multi-term emacs directory tracking
# chpwd() { print -P "\033AnSiTc %d" }
# print -P "\033AnSiTu %n"
# print -P "\033AnSiTc %d"

case $TERM in
	eterm-color*)
		chpwd() { print -P "\033AnSiTc %d" }
		
		print -P "\033AnSiTu %n"
		print -P "\033AnSiTc %d"
esac 



# THIS MUST BE AT THE END
# zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
