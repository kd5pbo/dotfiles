# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

export PATH HOME TERM
#export PS1="[\\u@\\h:\\w]\\\$ " 
export PS1='\[\e[34m\][\u@\h:\[\e[1m\]\w\[\e[22m\]]\$ \[\e[0m\]'
export PAGER=less
export EDITOR=vim
set -o emacs
export PKG_PATH=http://mirror.esc7.net/pub/OpenBSD/$(uname -r)/packages/$(uname -p)/
export GOROOT=$HOME/usr/go
export GOPATH=$HOME/go
export CGO_ENABLED=0
export PATH=$HOME/bin:$GOROOT/bin:$GOPATH/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
sprunge() {
        curl -F 'sprunge=<-' http://sprunge.us
}

# Use srm if we have it
if which srm >/dev/null 2>&1; then
        alias rm=srm
fi

# OS-specific .profile
if [[ -f $HOME/.dotfiles/profile.$(uname -s) ]]; then
        . $HOME/.dotfiles/profile.$(uname -s)
fi

# Include settings specific to local machine.  Should be last line
if [[ -f $HOME/.profile.local ]]; then
        . $HOME/.profile.local
fi
