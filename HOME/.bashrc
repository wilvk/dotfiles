# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:/usr/local/Cellar/node/12.6.0/bin"
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
alias vzsh="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"

export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export DYLD_LIBRARY_PATH=/usr/local/opt/capstone/lib/:$DYLD_LIBRARY_PATH
alias python=python3
alias pip=pip3

function gmttime {
    curl http://s3.amazonaws.com -v 2>&1|grep "Date: " | awk '{ print $3 " " $5 " " $4 " " $7 " " $6 " GMT"}'
}
