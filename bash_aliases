# Exports
export VISUAL="atom"
export EDITOR="$VISUAL"
export GIT_EDITOR="nano"
export ATOM_HOME=$HOME/dotfiles/atom
# Android SDK
export ANDROID_HOME="/usr/local/opt/android-sdk"
PATH=$ANDROID_HOME/tools:$PATH
PATH=$ANDROID_HOME/platform-tools:$PATH
PATH=$ANDROID_HOME/build-tools/20.0.0:$PATH
# Ant
export ANT_HOME=/usr/share/ant
PATH=$ANT_HOME/bin:$PATH
# Java
export JAVA_HOME=`/usr/libexec/java_home`

# highlighting grep matches in color
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32' #green
# Always use color output for `ls`
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias ls="ls -GF"
alias ll="ls -lhAGF"
alias la="ls -AGF"

# Get OS X Software Updates, and update installed Homebrew
alias update="echo 'Updating OSX ...'; sudo softwareupdate -i -a; echo 'Updating Homebrew ...'; brew update; brew upgrade --all; brew cleanup; echo 'Updating Homebrew Caskroom ...'; brew cask update; brew cask cleanup; echo 'Updating NPM ...'; npm install -g npm@latest; echo 'Updating NPM Global Packages...'; npm update -g; echo 'Updating GEM...'; sudo gem update --system; sudo gem update; sudo gem clean;"
# IP addresses
alias ipglobal="dig +short myip.opendns.com @resolver1.opendns.com"
alias ip="ifconfig | grep -o '\inet\s[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.*broadcast' | grep -o '[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}'"
# npm list only top level
alias ng="npm list -g --depth=0 2>/dev/null"
alias nl="npm list --depth=0 2>/dev/null"
# show a list of all aliases
alias aliases="compgen -a"