## Prerequisites

### Arch

```sh
paru -S zsh zsh-completions fzf ttf-meslo-nerd fastfetch
```

### Fedora

```sh
# TODO: zsh-completions fzf ttf-meslo-nerd
sudo dnf install zsh fastfetch
```

## Setup

```sh
mkdir ~/.config/zsh
git clone https://github.com/Mithras/zsh.git ~/.config/zsh
echo 'ZDOTDIR=~/.config/zsh' > ~/.zshenv
chsh -s $(which zsh)
```

## Pacman hook

_/etc/pacman.d/hooks/zsh-rehash.hook_
```
[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = Path
Target = usr/bin/*

[Action]
Depends = zsh
Depends = procps-ng
When = PostTransaction
Exec = /usr/bin/pkill zsh --signal=USR1
```
