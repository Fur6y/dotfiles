# GPG with Git

```bash
brew install gpg2 pinentry-mac

gpg --full-gen-key

gpg --list-secret-keys --keyid-format LONG <EMAIL>

git config --global user.signingkey <ID>
git config --global commit.gpgsign true
git config --global tag.gpgsign true

gpg --armor --export <ID> | pbcopy
```

## GnuPG config

`~/.gnupg/gpg-agent.conf`

Killing the agent after modifying the config file.

```bash
gpgconf --kill gpg-agent
```

## Fix the permissions for GnuPG config directory

```bash
chown -R $(whoami) ~/.gnupg
find ~/.gnupg -type f -exec chmod 600 {} \;
find ~/.gnupg -type d -exec chmod 700 {} \;
```
