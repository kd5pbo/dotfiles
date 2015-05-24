# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

export PATH HOME TERM
#export PS1="[\\u@\\h:\\w]\\\$ " 
export PS1='\[\e[34m\][\u@\h:\[\e[1m\]\w\[\e[22m\]]\$ \[\e[0m\]'
export PAGER=less
export EDITOR=vim
set -o emacs
export GOROOT=$HOME/usr/go
export GOPATH=$HOME/go
export CGO_ENABLED=0
export PATH=$HOME/bin:$GOROOT/bin:$GOPATH/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games

###########
# Aliases #
###########
# Use srm if we have it
if which srm >/dev/null 2>&1; then
        alias rm=srm
fi
# Fix my common typos
alias gunz=gunzip

#############
# Functions #
#############
# Push/Pull changed .ssh/known_hosts
pushkh () {
        (cd $HOME/.dotfiles/ &&
                ./backup_known_hosts &&
                git commit -m "pushkh update" .ssh/known_hosts.enc &&
                git push)
}
pullkh () {
        (cd $HOME/.dotfiles/ &&
                git pull &&
                ./restore_known_hosts)
}
# Send data to sprunge
sprunge() {
        curl -F 'sprunge=<-' http://sprunge.us
}

# OS-specific .profile
if [[ -f $HOME/.dotfiles/profile.$(uname -s) ]]; then
        . $HOME/.dotfiles/profile.$(uname -s)
fi

# Include settings specific to local machine.  Should be last line
if [[ -f $HOME/.profile.local ]]; then
        . $HOME/.profile.local
fi
