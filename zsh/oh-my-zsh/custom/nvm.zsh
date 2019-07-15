if [ -d "$HOME/.nvm" ]
then
    export NVM_DIR="$HOME/.nvm"
    # This loads nvm
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
    # This loads nvm bash_completion
    [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
fi
