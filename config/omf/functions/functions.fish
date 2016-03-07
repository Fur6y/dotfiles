# atom
function atom_packages_backup --description "backup all installed atom packages"
    apm list --installed --bare --dev false > $ATOM_HOME/packages.txt
end
function atom_packages_install --description "install all atom packages from backup list"
    apm install --packages-file $ATOM_HOME/packages.txt
end

# update functions
function update_osx --description "update osx"
    sudo softwareupdate -i -a $argv
end

function update_npm --description "update global npm"
    npm install npm -g
    npm update -g
end

function update_gem --description "update gem"
    sudo gem update --system
    sudo gem update --no-rdoc --no-ri
end

function update_omf --description "update oh-my-fish"
    omf update
end

function update_brew --description "update homebrew apps"
    brew update
    brew upgrade --all
    brew cleanup
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
    update_omf
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
