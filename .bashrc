# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1="\[\e[31m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\] \[\e[35m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "

# setxkbmap es

if [[ "$(tty)" = "/dev/tty1" ]]; then
  	pgrep dwm || startx
fi

LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.doc=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106'
export LS_COLORS

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE= HISTFILESIZE= # Infinite history.

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Environment variables
export EDITOR="nvim" 		# editor env var
export TERM="st-256color"	# getting proper colors
export TERMINAL="st"	# for terminal env
export DTERM="${TERMINAL} -e"   # terminal executing program variable
export VISUAL="nvim"
export BROWSER="brave"
PATH=$PATH:"$HOME/.local/bin:$HOME/.local/bin/statusbar"   # path for .local/bin
export penpath="/run/media/utane/DUAN"

# ~/ Clean-up:
export LESSHISTFILE="-"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# input method
# export GTK_IM_MODULE='fcitx'
# export QT_IM_MODULE='fcitx'
# export SDL_IM_MODULE='fcitx'
# export XMODIFIERS='@im=fcitx'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
# (cat ~/.cache/wal/sequences &)

se() { du -a ~/.local/bin/* ~/.config/* | awk '{print $2}' | fzf | xargs -r $EDITOR ;}
