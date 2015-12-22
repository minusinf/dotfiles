# Bashrc for cscs system
# Pascal's kesch and escha hacks

if [[ "$(hostname)" = "kesch"* ]] || [[ "$(hostname)" = "escha"* ]] ; then
    export SCRATCH=/scratch/$(whoami)
    . /etc/bash_completion.d/git
    module load Python
    module load git
    module load tmux
    export PATH=~/.local/bin/:$PATH
    export PYTHONPATH=$PYTHONPATH:/project/c01/install/kesch/stella/trunk/release_double/python/
fi
if [[ "$(hostname)" = "lema"* ]] ; then 
    module load git
fi

alias tmux_up_DISPLAY='export $(tmux show-environment | grep "^DISPLAY")'
alias mav="module av 2>&1 | grep -i "
alias qu="squeue | grep spoerrip"
export TERM=xterm-256color
export EDITOR=/usr/bin/vim

if [[ -z $TMUX ]]; then
    if [ -e /usr/share/terminfo/x/xterm+256color ]; then # may be xterm-256 depending on your distro
        export TERM='xterm-256color'
    else
        export TERM='xterm'
    fi
else
    if [ -e /usr/share/terminfo/s/screen-256color ]; then
        export TERM='screen-256color'
    else
        export TERM='screen'
    fi
fi

test -s ~/.alias && . ~/.alias || true
test -s /etc/bashrc && . /etc/bashrc
