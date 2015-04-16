# Exports
export VISUAL="atom"
export EDITOR="$VISUAL"
export GIT_EDITOR="atom --wait"
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

# Always use color output for `ls`
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls="ls -G"

# Get OS X Software Updates, and update installed Homebrew
alias update="echo 'Updating OSX ...'; sudo softwareupdate -i -a; echo 'Updating Homebrew ...'; brew update; brew upgrade; brew cleanup; echo 'Updating Homebrew Caskroom ...'; brew cask update; brew cask cleanup; echo 'Updating NPM ...'; npm install -g npm@latest"

# IP addresses
alias ipglobal="dig +short myip.opendns.com @resolver1.opendns.com"
alias ip="ifconfig | grep -o '\inet\s[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.*broadcast' | grep -o '[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}'"

