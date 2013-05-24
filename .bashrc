# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# Colors {
# Setup some colors to use later in interactive shell or scripts
    export NC='\033[0m' # No Color
    export WHITE='\033[1;37m'
    export BLACK='\033[0;30m'
    export BLUE='\033[0;34m'
    export LIGHT_BLUE='\033[1;34m'
    export GREEN='\033[0;32m'
    export LIGHT_GREEN='\033[1;32m'
    export CYAN='\033[0;36m'
    export LIGHT_CYAN='\033[1;36m'
    export RED='\033[0;31m'
    export LIGHT_RED='\033[1;31m'
    export PURPLE='\033[0;35m'
    export LIGHT_PURPLE='\033[1;35m'
    export BROWN='\033[0;33m'
    export YELLOW='\033[1;33m'
    export GRAY='\033[1;30m'
    export LIGHT_GRAY='\033[0;37m'
# }

# History {
    HISTCONTROL=ignoredups
    HISTCONTROL=erasedups
    HISTFILESIZE=1234
    HISTIGNORE="cd:exit:..:...:ls:l:ll:la"
    shopt -s histappend # do not overwrite .bash_history
# }


# Utils {

    mkcd() # mkcd: mkdir, then cd
    {
        if [ $# = "1" ]
        then
            mkdir -p "$1"
            cd "$1"
        else
            echo "Usage: mkcd folder"
        fi
    }
# }
# Alias {
    alias ll='ls -lh'
    alias la='ls -A'
    alias l='ls -CF'
    alias -- -='cd -'
    alias ..='cd ..'
    alias ...='cd ../..'
    alias bl='bc -l'
    alias h='head'
    alias t='tail'
    alias vimrc='vim ~/.vimrc'
    alias proxy='python ~/Downloads/wallproxy-plus/local/startup.py'

    alias g='git'
    alias ga='git add'
    alias gaf='git add -f'
    alias gr='git rm'
    alias gc='git commit'
    alias gca='git commit -a'
    alias gd='git diff'
    alias gdc='git diff --cached'
    alias gs='git status'
    alias gpu='git push'
    alias gpl='git pull'
    alias gb='git branch'
    alias gbd='git branch -d'
    alias gbD='git branch -D'
    alias gm='git merge'
    alias gl='git log'
    alias glp='git log -p'
    alias gco='git checkout'
    alias myopen='xdg-open'
    alias cl='clear'
# }

# Bind { //NOTE: bind used instead of sticking these in inputrc
    bind '"\C-j": menu-complete'
    bind '"\C-k": menu-complete-backward'
    bind '"\C-o": backward-kill-word'
    bind 'set completion-ignore-case on'
# }

# Exports {
    export CDPATH='./:~/Wdir:/var:/media'
    export GTK_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
    export QT_IM_MODULE=ibus
    export EDITOR=vim
    export DCPPATH=~/Wdir/Dotfiles/
    [ -d ~/.bin ] && export PATH=$PATH:$HOME/.bin
# }

# Misc {
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

    shopt -s checkwinsize
    shopt -s cdspell

    if [ -x /usr/bin/dircolors ]
        then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

    case "$TERM" in
        xterm*|rxvt*)
            PS1="\[\033]0; ${PWD}\007\]\[${LIGHT_GREEN}\]\w\[${RED}\]$ \[${CYAN}\]"

            ;;
        screen*)
            PS1="\[\033]0; ${PWD}\007\]\[${LIGHT_GREEN}\]\w\[${RED}\]$ \[${CYAN}\]"
            # Use current dir as the title
            SCREENTITLE='\[\ek\W\e\\\]'
            PS1=${SCREENTITLE}${PS1}
            ;;
        *)
            ;;
    esac
# }
export M2_HOME=/usr/local/apache-maven/apache-maven-2.2.1
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
