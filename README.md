# Dotfiles

## Generating ssh-keys

```console
ssh-keygen -t ed25519 -C "david-lorenzo@github.com" -f ~/.ssh/id_ed_gh
eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed_gh && cat ~/.ssh/id_ed_gh.pub
```

## Installation
```console
wget https://raw.githubusercontent.com/david-lorenzo/.dotfiles/main/bin/install.sh && sh install.sh
```
