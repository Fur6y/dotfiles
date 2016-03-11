##### FISH #####
# delete fish welcome message
set -e fish_greeting
# add my-functions directory
set -g fish_function_path $fisher_config/my-functions $fish_function_path

##### EXPORTS #####
# dotfiles directory
set -gx DOTFILES $HOME/dotfiles
# language default
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8
# editor
set -gx VISUAL vim
set -gx EDITOR vim
set -gx GIT_EDITOR vim
# atom
set -gx ATOM_HOME $DOTFILES/atom
# grep
set -gx GREP_OPTIONS "--color=auto"
set -gx GREP_COLOR "1;31" # red
# java
set -gx JAVA_HOME (/usr/libexec/java_home)
# android
set -gx ANDROID_HOME $HOME/Library/Android/sdk
# ant
set -gx ANT_HOME /usr/share/ant
# gradle
set -gx GRADLE_HOME /opt/homebrew-cask/Caskroom/android-studio/1.4.0.10/Android\ Studio.app/Contents/gradle/gradle-2.8
# maven
set -gx MAVEN_OPTS="-Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m"
# jboss
set -gx JBOSS_HOME /usr/local/opt/jboss-as/libexec
# graphiz
set -gx GRAPHVIZ_DOT /usr/local/Cellar/graphviz/2.38.0/bin/dot
# fisherman plugin 'bd'
set -gx BD_OPT 'insensitive'
# docker
set -gx DOCKER_TLS_VERIFY "1"
set -gx DOCKER_HOST "tcp://192.168.99.100:2376"
set -gx DOCKER_CERT_PATH $HOME/.docker/machine/machines/default
set -gx DOCKER_MACHINE_NAME "default"


##### PATH #####
set -gx PATH $PATH /usr/local/sbin
# android
set -gx PATH $PATH $ANDROID_HOME/platform-tools
set -gx PATH $PATH $ANDROID_HOME/tools
# ant
set -gx PATH $PATH $ANT_HOME/bin
# gradle
set -gx PATH $PATH $GRADLE_HOME/bin
# jboss
set -gx PATH $PATH $JBOSS_HOME/bin


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
