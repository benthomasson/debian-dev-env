#vim: set syntax bash
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/ssh-agent ]; then
    . ~/ssh-agent
fi
if [ -f ~/ssh-agent-${HOSTNAME} ]; then
    . ~/ssh-agent-${HOSTNAME}
fi
if [ -f /usr/bin/keychain ]; then
    keychain -q
fi
if [ -f ~/.keychain/${HOSTNAME}-sh ]; then
    . ~/.keychain/${HOSTNAME}-sh
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
export EDITOR=vim
function title {
  printf "\033]0;%s\007" "$1"
}
function title_here {
  here=$(basename `pwd`)
  printf "\033]0;%s\007" "${here}"
}


function __prompt_command() {
    local EXIT="$?"             # This needs to be first

    if [ $EXIT != 0 ]; then
        echo "Exit code ${EXIT}"
    fi
    if [ "$PWD" != "$MYOLDPWD" ]; then
        MYOLDPWD="$PWD"
        test -e .venv && workon `cat .venv`
    fi
    title_here
}

PS1="\n[\[\033[32m\]\t \u@\h:\w]\[\033[0m\]\n\[\033[1;36m\]\[\033[1;33m\]$ \[\033[0m\]"
export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs
export PATH=$PATH:~/bin


export WORKON_HOME=$HOME/env
export PROJECT_HOME=$HOME/git
if [ -f  /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
