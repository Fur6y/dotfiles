# Exports
export VISUAL="atom"
export EDITOR="$VISUAL"
export GIT_EDITOR="atom --wait"

# Always use color output for `ls`
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls="ls -G"

# Get OS X Software Updates, and update installed Homebrew
alias update="echo 'Updating OSX ...'; sudo softwareupdate -i -a; echo 'Updating Homebrew ...'; brew update; brew upgrade; brew cleanup; echo 'Updating Homebrew Caskroom ...'; brew cask update; brew cask cleanup; echo 'Updating NPM ...'; npm install -g npm@latest"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

