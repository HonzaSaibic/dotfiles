#     ____  __                             _____        __
#    / __ \/ /_        ____ ___  __  __   /__  /  _____/ /_
#   / / / / __ \______/ __ \_  \/ / / /_____/ /  / ___/ __ \
#  / /_/ / / / /_____/ / / / / / /_/ /_____/ /__(__  ) / / /
#  \____/_/ /_/     /_/ /_/ /_/\__, /     /____/____/_/ /_/
#                             /____/
#
# Set PATH
autoDrivers="/Users/jan-mac/Drivers"
scriptsPATH="/Users/jan-mac/sd/Scripts"

# Set PATH to Android SDK
export ANDROID_HOME="Users/jan-mac/Library/Android/sdk"
export ANDROID_SDK_ROOT="Users/jan-mac/Library/Android/sdk"
export ANDROID_AVD_HOME="Users/jan-mac/.android/avd"

#SET PATH
PATH="$PATH:$autoDrivers:$scriptsPATH:$ANDROID_SDK_ROOT:$ANDROID_AVD_HOME"

# Path to your oh-my-zsh installation.
export ZSH="/Users/jan-mac/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose
#
plugins=(
    git
    vi-mode
    jump
    zsh-autosuggestions
)

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# Disable autocompletion from tab

set -o vi
source $ZSH/oh-my-zsh.sh


#### LS show different colors for directories and files etc.
export LSCOLORS='ExhxCxgxcxfxDxdxGxAxHx'
#

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"


export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Preferred editor
export EDITOR='vim'

#
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

function screenshotNameGenerator {
	echo "screen-$(date "+%d.%m.%Y-%H.%M").png"
}
function videoNameGenerator {
	echo "video-$(date "+%d.%m.%Y-%H.%M").mp4"
}
#### ALIASES
alias ls='ls -GH'
alias l='ls -alshF'
alias ll='ls -la'

# Jump plugin alias
alias j='jump'

# Projects aliases
alias ptestm="pytest -s -v -m "
alias nrkit="pytest -s -v -m nrki_report"

# GIT aliases
alias grc="git reset --soft HEAD~1"
alias gwip='git commit -m "WIP"'
alias grew='git commit --ammend -m'

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias senv="source env*/bin/activate"
alias spen="source spider391/bin/activate"
alias adblog="adb logcat | grep -Ei 'Capacitor| E |onesignal'"
alias adbpull='adb pull /sdcard/video-record.mp4 ~/sd/Videos/Mallpay/adbVideos/$(videoNameGenerator)'
alias adbrec="adb shell screenrecord /sdcard/video-record.mp4"
alias adbrem="adb shell rm /sdcard/video-record.mp4"
alias takenote="vim /Users/jan-mac/sd/Documents/Recycle/random-notes.txt"
alias ipc="ip addr show | grep 192"

# binding autocomplete
bindkey '^k' autosuggest-accept


# Testing
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# FZF settings
# Feed the output of fd into fzf
#fd --type f | fzf
# Setting fd as the default source for fzf
#export FZF_DEFAULT_COMMAND='fd --type f'
# Now fzf (w/o pipe) will use fd instead of find
#fzf
# To apply the command to CTRL-T as well
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

#Set Python PATH for mallpay-selenium
export PYTHONPATH=$PYTHONPATH:/Users/jan-mac/Documents/Repositories/mallpay-selenium
export PYTHONBREAKPOINT=ipdb.set_trace
