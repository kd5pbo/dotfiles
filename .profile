# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

export PATH HOME TERM
export PS1="[\\u@\\h:\\w]\\\$ " 
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

# TODO: Make OS-specific dotfiles?

# OS-specific .profile
. $HOME/.dotfiles/profile.$(uname -s)
export GOOS=openbsd
export GOACH=amd64
alias pst='dtpstree -alptu'
exits() {
        echo -e "code\tline"
        grep -n Exit $1 | perl -ne '
        if (/(\d+).*Exit\(-(\d+)\).*/){
                print "$2\t$1\t";
                /^\d+:\t*(\\\\)?\t*(.*)/;
                print "$2\n";
        }' | sort -n
}

# Include settings specific to local machine.  Should be last line
if [[ -f $HOME/.profile.local ]]; then
        . $HOME/.profile.local
fi
