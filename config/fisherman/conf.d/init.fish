##### FISH #####
# delete fish welcome message
set -e fish_greeting
# add my-functions directory
set -g fish_function_path $fisher_config/my-functions $fish_function_path

##### EXPORTS #####
# dotfiles directory
set -gx DOTFILES $HOME/dotfiles
# language default
set -gx LANG en_US.UTF-8
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
set -gx JRE_HOME (/usr/libexec/java_home)
# android
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx ANDROID_NDK $ANDROID_HOME/ndk-bundle
# ant
set -gx ANT_HOME /usr/share/ant
set -gx ANT_OPTS "-Xmx512M"
# gradle
set -gx GRADLE_HOME /opt/homebrew-cask/Caskroom/android-studio/1.4.0.10/Android\ Studio.app/Contents/gradle/gradle-2.8
# maven
set -gx M3_HOME /usr/local/Cellar/maven/3.3.9
set -gx MAVEN_OPTS "-Xms512m -Xmx1024m"
# jboss
set -gx JBOSS_HOME /usr/local/opt/jboss-as/libexec
# graphiz
set -gx GRAPHVIZ_DOT /usr/local/Cellar/graphviz/2.38.0/bin/dot
# fisherman plugin 'bd'
set -gx BD_OPT 'insensitive'
# node
set -gx NODE_PATH /usr/local/lib/node_modules
# latex
if [ ! type kpsewhich 2> /dev/null ]
    set -gx TEXDIR (kpsewhich -var-value TEXDIR) # the main TeX directory
    set -gx TEXMFLOCAL (kpsewhich -var-value TEXMFLOCAL) # directory for site-wide local files
    set -gx TEXMFSYSVAR (kpsewhich -var-value TEXMFSYSVAR) # directory for variable and automatically generated data
    set -gx TEXMFSYSCONFIG (kpsewhich -var-value TEXMFSYSCONFIG) # directory for local config
    set -gx TEXMFVAR (kpsewhich -var-value TEXMFVAR) # personal directory for variable and automatically generated data
    set -gx TEXMFCONFIG (kpsewhich -var-value TEXMFCONFIG) # personal directory for local config
    set -gx TEXMFHOME (kpsewhich -var-value TEXMFHOME) # directory for user-specific files
end
# sane
set -gx SANE_DEFAULT_DEVICE "net:192.168.178.2:plustek:libusb:001:005"
# docker
if [ ! type docker-machine 2> /dev/null ]
    if [ (docker-machine status) = "Running" ]
        eval (docker-machine env default --shell fish)
    end
end


##### PATH #####
if [ -d /usr/local/sbin ]
    set -gx PATH $PATH /usr/local/sbin
end
# android
if [ -d $ANDROID_HOME ]
    set -gx PATH $PATH $ANDROID_HOME/platform-tools
    set -gx PATH $PATH $ANDROID_HOME/tools
end
if [ -d $ANDROID_NDK ]
    set -gx PATH $PATH $ANDROID_NDK
end

# ant
if [ -d $ANT_HOME ]
    set -gx PATH $PATH $ANT_HOME/bin
end
# gradle
if [ -d $GRADLE_HOME ]
    set -gx PATH $PATH $GRADLE_HOME/bin
end
# jboss
set -gx PATH $PATH $JBOSS_HOME/bin


##### ALIASES #####
# git number
alias nrm "git number -c rm -di"
# ip addresses
alias ipglobal "dig +short myip.opendns.com @resolver1.opendns.com"
alias ip "ifconfig | grep -o '\inet\s[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.*broadcast' | grep -o '[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}'"
# npm list only top level
alias ng "npm list -g --depth=0 2>/dev/null"
alias nl "npm list --depth=0 2>/dev/null"
# google chrome
alias chrome "open -n -a \"Google Chrome\" --args"
# shell
alias defaultshell "chsh -s /bin/bash"
alias fishshell "chsh -s /usr/local/bin/fish"
# osx
alias hidefiles "defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"
alias showfiles "defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"
# json
alias json "python -m json.tool"
# print all environment variables
alias vars "set -xg"
# android
alias nex5 "emulator -avd Nex5 -gpu on -no-boot-anim -netdelay none -netspeed full -scale 0.35"
