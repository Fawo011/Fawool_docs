# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=/home/lsy/snap/clion/198/bin:$PATH


export ROS_IP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '172.17.0.1'`

if  test -z "${ROS_IP}"
then
        export ROS_IP=`dig +short localhost`
fi

export ROS_MASTER_URI=http://localhost:11311
#export ROS_MASTER_URI=http://192.168.1.97:11311
export ROBOT_TYPE=standard6
echo "ROS IP: ${ROS_IP}
ROS Master URI: ${ROS_MASTER_URI}
ROBO TYPE = ${ROBOT_TYPE}"

alias setcan0='sudo ip link set can0 up type can bitrate 1000000'
alias setcan1='sudo ip link set can1 up type can bitrate 1000000'
alias setcan2='sudo ip link set can2 up type can bitrate 1000000'
alias setcan3='sudo ip link set can3 up type can bitrate 1000000'
alias engineer_1='ssh dynamicx@192.168.1.194'
alias wired='ssh -o StrictHostKeyChecking=no -l "dynamicx" "192.168.100.2"'
alias balance='ssh dynamicx@192.168.1.110'
alias hero='ssh dynamicx@192.168.1.101'
alias standar4='ssh dynamicx@192.168.1.104'
alias standar5='ssh dynamicx@192.168.1.105'
alias standar3='ssh dynamicx@192.168.1.103'
alias littlestandard1='ssh dynamicx@192.168.1.174'
alias littlestandard2='ssh dynamicx@192.168.1.97'
alias sentry='ssh dynamicx@192.168.1.111'
alias engineer_client='rosrun actionlib_tools axclient.py /engineer_middleware/move_steps'
alias note='typora rm_note/rm_clion/rm_manual.md'
alias rqt_joint='rosrun rqt_joint_trajectory_controller rqt_joint_trajectory_controller'
export filepath="/etc/apt/"
alias load_ros='mon launch engineer_arm_config start.launch'
alias load_controller='. load.sh'
alias bringup="mon launch rm_bringup engineer.launch "
alias use_current="rosrun moveit_commander moveit_commander_cmdline.py"
alias bashrc="vim ~/.bashrc"
alias find_wired="nmap 10.42.0.1/24"
export MVCAM_SDK_PATH=/opt/MVS

export MVCAM_COMMON_RUNENV=/opt/MVS/lib
export LD_LIBRARY_PATH=/opt/MVS/lib/64:/opt/MVS/lib/32:$LD_LIBRARY_PATH
source ~/rm_ws/devel/setup.bash



# >>> fishros initialize >>>
#source /opt/ros/noetic/setup.bash 
# <<< fishros initialize <<<
