[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

# Dotfiles

## Install

```shell
cd ~/dotfiles && npm i
ln -s ~/dotfiles/npm/npmrc ~/.npmrc
ln -s ~/dotfiles/.eslintrc ~/.eslintrc
ln -s ~/dotfiles/.remarkrc ~/.remarkrc
./install.sh
```

## Aliases

```shell
update_all      # runs update for osx, brew, brew cask, npm, gem
ipglobal        # print global ip address
ip              # print local ip address
nl              # print list of all local top level npm dependencies
ng              # print list of all global top level npm dependencies
```

## Directories

-   Homebrew Cask Install: /opt/homebrew-cask/Caskroom/
-   Homebrew Cask Formulaes: /usr/local/Library/Taps/caskroom/homebrew-cask/Casks/
