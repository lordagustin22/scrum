# so, aliases for some programs are here, as follows:
# youtube-dl
alias \
 yt='youtube-dl --add-metadata -i' \
 yta='yt -x -f bestaudio/best -o "~/Musica/dl-music/%(title)s.%(ext)s"' \
 ytp='yt -x -f bestaudio/best -o "~/Vídeos/Podcast/%(title)s.%(ext)s"'

# bashrc/other configs
alias \
 src='source ~/.bashrc && echo "updateado el bashrc COCHARL NWN"' \
 nc='$EDITOR ~/.config/$EDITOR/init.vim' \
 sxcon='$EDITOR ~/.config/sxhkd/sxhkdrc' \

# general commands
alias \
 v='$EDITOR' \
 suvi='sudo $EDITOR'

# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	mkd="mkdir -pv" \
        rmd="rmdir -v" \
	sxiv="sxiv -q -a -t" \
	ffmpeg="ffmpeg -hide_banner"

# Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto"

# These common commands are just too long! Abbreviate them.
alias \
	z="zathura" \
	sdn="sudo shutdown -h now" \
        mk="sudo make install" \
        df="df -lH" \
        n="neomutt" \
        mps="mpv --shuffle"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias hst='history | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -sel c'
fi

alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias lf='lfub'

# /dev/null aliases (no annoying stdout from programs)
alias  \
        bra='brave > /dev/null 2>&1' \
        pcm='pcmanfm > /dev/null 2>&1 &' \
        picom='picom > /dev/null 2>&1 &'
