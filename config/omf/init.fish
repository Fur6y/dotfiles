##### FISH #####
# delete fish welcome message
set -e fish_greeting


##### EXPORTS #####
# language default
set -xg LC_ALL en_US.UTF-8
set -xg LC_CTYPE en_US.UTF-8
# editor
set -xg VISUAL vim
set -xg EDITOR vim
set -xg GIT_EDITOR vim
# atom
set -xg ATOM_HOME $HOME/dotfiles/atom
# grep
set -xg GREP_OPTIONS "--color=auto"
set -xg GREP_COLOR "1;31" # red
# java
set -xg JAVA_HOME (/usr/libexec/java_home)
# android
set -xg ANDROID_HOME $HOME/Library/Android/sdk
# ant
set -xg ANT_HOME /usr/share/ant
# gradle
set -xg GRADLE_HOME /opt/homebrew-cask/Caskroom/android-studio/1.4.0.10/Android\ Studio.app/Contents/gradle/gradle-2.8
# maven
set -xg MAVEN_OPTS="-Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m"
# jboss
set -xg JBOSS_HOME /usr/local/opt/jboss-as/libexec
# graphiz
set -xg GRAPHVIZ_DOT /usr/local/Cellar/graphviz/2.38.0/bin/dot


##### PATH #####
# android
set -xg PATH $PATH $ANDROID_HOME/platform-tools
set -xg PATH $PATH $ANDROID_HOME/tools
# ant
set -xg PATH $PATH $ANT_HOME/bin
# gradle
set -xg PATH $PATH $GRADLE_HOME/bin
# jboss
set -xg PATH $PATH $JBOSS_HOME/bin


##### ALIASES #####
# ip addresses
alias ipglobal="dig +short myip.opendns.com @resolver1.opendns.com"
alias ip="ifconfig | grep -o '\inet\s[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.*broadcast' | grep -o '[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}'"
# npm list only top level
alias ng="npm list -g --depth=0 2>/dev/null"
alias nl="npm list --depth=0 2>/dev/null"
# google chrome
alias chrome="open -n -a \"Google Chrome\" --args"
# shell
alias defaultshell="chsh -s /bin/bash"
alias fishshell="chsh -s /usr/local/bin/fish"
# osx
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"
alias showfiles="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"


##### PRIVATE #####
source $OMF_CONFIG/init.private.fish
