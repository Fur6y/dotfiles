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
