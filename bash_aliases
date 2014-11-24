# Always use color output for `ls`
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls="ls -G"

# Get OS X Software Updates, and update installed Homebrew
alias update="sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; brew cask update; brew cask cleanup"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

