# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

export PATH HOME TERM
export PS1="[\\u@\\h:\\w]\\\$ " 
export PAGER=less
export EDITOR=vim
set -o emacs
export PKG_PATH=http://mirror.esc7.net/pub/OpenBSD/$(uname -r)/packages/$(uname -p)/
export GOOS=openbsd
export GOACH=amd64
export GOROOT=$HOME/usr/local/go
export GOPATH=$HOME/go
export CGO_ENABLED=0
#export SPRUNGE="| curl -s -F 'sprunge=<-' http://sprunge.us"
export PATH=$HOME/bin:$GOROOT/bin:$GOPATH/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
sprunge() {
        curl -F 'sprunge=<-' http://sprunge.us
}

alias pst='dtpstree -alptu'
exits() {
        echo -e "code\tline"
        grep -n Exit $1 | perl -ne '
        if (/(\d+).*Exit\(-(\d+)\).*/){
                print "$2\t$1\t";
                /\t*(\\\\)?\t*(.*)/;
                print "$2\n";
        }' | sort -n
}
