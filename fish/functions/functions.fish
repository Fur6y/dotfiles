# npm
function npm_backup --description "backup the list of installed npm packages"
    npm list -g --depth=0 > $DOTFILES/npm/npm_packages.txt
end

# homebrew
function brew_formulae_backup --description "backup the list of installed homebrew formulae"
    brew list > $DOTFILES/brew/homebrew_formulae.txt
    brew tap > $DOTFILES/brew/homebrew_taps.txt
    brew cask list > $DOTFILES/brew/homebrew_cask_formulae.txt
end
function brew_formulae_install --description "install all homebrew formulae from backup list"
    echo not implemented yet
end

# update functions
function update_osx --description "update osx"
    sudo softwareupdate -i -a $argv
end

function update_npm --description "update global npm"
    npm install -g npm@latest
    for package_info in (npm -g outdated --parseable --depth=0)
        set -l package_old (echo $package_info | cut -d: -f2)
        set -l package_new (echo $package_info | cut -d: -f4)
        echo "# update $package_old to $package_new"
        npm -g uninstall "$package_old"
        npm -g install "$package_new"
    end
end

function update_gem --description "update gem"
    sudo gem update --system
    sudo gem update --no-rdoc --no-ri
end

function update_fisher --description "update fisherman"
    # update fisherman
    fisher update
    # update all the plugins in the cache concurrently
    fisher list --bare | xargs -n1 -P3 fish -c "fisher update -"
end

function update_brew --description "update homebrew apps"
    brew update; and brew upgrade --all; and brew cleanup;
end

function update_brew_cask --description "update homebrew cask apps"
    function _update_prompt
        set_color green
        echo "y/n? "
    end

    brew update
    brew cask update
    for app in (brew cask list)
        set app_info (brew cask info $app)
        set not_installed (echo $app_info | grep -F "Not installed")

        if [ -n "$not_installed" ]
            echo "update $app?"

            set yn ""
            while test $yn != "y" -a $yn != "yes" -a $yn != "n" -a $yn != "no"
                read yn -p _update_prompt
            end

            if test $yn = "y" -o $yn = "yes"
                brew cask remove --force $app
                brew cask install $app
            end
        end
    end
    brew cask cleanup;

    functions -e _update_prompt
end

function update_all --description "update all"
    update_osx
    update_npm
    update_gem
    update_fisher
    update_brew
    update_brew_cask
end

# cd aliases
function ..
  cd ..
end
function cd.
  cd ..
end
function cd..
  cd ../..
end
function cd...
  cd ../../..
end
function cd....
  cd ../../../..
end
function cd.....
  cd ../../../../..
end
function cd......
  cd ../../../../../..
end
