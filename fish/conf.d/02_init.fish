##### DOTFILES #####
set -gx DOTFILES $HOME/dotfiles

##### FISH #####
# settings for fish theme "bobthefish"
set -gx theme_color_scheme user

# import vendor scripts and functions
for vendor in (find $DOTFILES/fish/vendor/functions -type d)
    set -g fish_function_path $fish_function_path $vendor
end
for vendor in (find $DOTFILES/fish/vendor/conf.d -name '*.fish')
    source $vendor
end

##### EXPORTS #####
# language default
set -gx LANGUAGE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8
set -gx LANG en_US.UTF-8

# editor
set -gx VISUAL vim
set -gx EDITOR vim
set -gx GIT_EDITOR vim
# man
if test "$MANPATH" = ""
    set -gx MANPATH (manpath | string split :)
end
set -gx MANPATH $MANPATH $DOTFILES/fish/man
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
set -gx GRADLE_HOME /Applications/Android\ Studio.app/Contents/gradle/gradle-2.14.1
# maven
set -gx M3_HOME /usr/local/Cellar/maven/3.3.9
set -gx MAVEN_OPTS "-Xms1024m -Xmx4096m -XX:PermSize=1024m"
# jboss
set -gx JBOSS_HOME /opt/wildfly10/
# graphiz
set -gx GRAPHVIZ_DOT /usr/local/Cellar/graphviz/2.38.0/bin/dot
# fisherman plugin 'bd'
set -gx BD_OPT "insensitive"
# node
set -gx NODE_PATH $HOME/.node_modules
# latex
if type --quiet "kpsewhich"
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
if type --quiet "docker-machine"
    if test (docker-machine status) = "Running"
        eval (docker-machine env default --shell fish)
    end
end
# qivicon emulator
set -gx VM_DEBUG "Y"
# set -gx VM_DEBUG_PORT "8000"
# set -gx VM_DEBUG_SUSPEND "Y"


##### PATH #####
if test -d /usr/local/sbin
    set -gx PATH $PATH /usr/local/sbin
end
# fastlane
if test -d $HOME/.fastlane/bin
    set -gx PATH $PATH $HOME/.fastlane/bin
end
# android
if test -d $ANDROID_HOME
    set -gx PATH $PATH $ANDROID_HOME/platform-tools
    set -gx PATH $PATH $ANDROID_HOME/tools
end
if test -d $ANDROID_NDK; set -gx PATH $PATH $ANDROID_NDK; end
# ant
if test -d $ANT_HOME
    set -gx PATH $PATH $ANT_HOME/bin
end
# gradle
if test -d $GRADLE_HOME
    set -gx PATH $PATH $GRADLE_HOME/bin
end
# jboss
if test -d $JBOSS_HOME
    set -gx PATH $PATH $JBOSS_HOME/bin
end
# node
if test -d /usr/local/opt/node@6/bin
    set -gx PATH $PATH /usr/local/opt/node@6/bin
end
if test -d /usr/local/opt/node@4/bin
    set -gx PATH $PATH /usr/local/opt/node@4/bin
end
# npm
if test -d $NODE_PATH/bin
    set -gx PATH $PATH $NODE_PATH/bin
end
# less
export LESS='--raw-control-chars'


##### ALIASES #####
# git number
alias nrm "git number -c rmtrash"
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
# vscode
alias code "code --user-data-dir $DOTFILES/vscode"
# grunt
alias g "grunt"
