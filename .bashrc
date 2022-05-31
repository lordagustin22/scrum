# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
PS1="\[\e[31m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\] \[\e[35m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "

# setxkbmap -layout "es" -variant "nodeadkeys,basic"
# setxkbmap -option 'grp:alt_shift_toggle'

# if [[ "$(tty)" = "/dev/tty1" ]]; then
  	# pgrep bspwm || startx
# fi

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
export TERMINAL="st"	        # for terminal env
export DTERM="${TERMINAL} -e"   # terminal executing program variable
export VISUAL="nvim"
export BROWSER="brave-browser-stable"
PATH=$PATH:$HOME/.local/bin:$HOME/.local/bin/ffmpeg:$HOME/.local/bin/statusbar         # path for .local/bin
export penpath="/run/media/utane"
export XDG_CACHE_HOME="$HOME/.cache"

# ~/ Clean-up:
export LESSHISTFILE="-"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="XDG_CONFIG_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
# (cat ~/.cache/wal/sequences &)

se() { du -a ~/.local/bin/* ~/.config/* | awk '{print $2}' | grep -v BraveSoftware | fzf | xargs -r $EDITOR ;}

export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export QT4_IM_MODULE='xim'
export CLUTTER_IM_MODULE='xim'
export SDL_IM_MODULE='ibus'
export XMODIFIERS='@im=ibus'
