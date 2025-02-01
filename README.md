# all my dotfiles (without secrets)

## to list all dotfiles in my home path:

```
find ~ -maxdepth 1 -type file -name ".*"|sort
```

## to copy all home path files into the current path:

```
cp ~/\.* .
```

# Notes:

When using, replace `<REPLACE_EMAIL>` with my actual email address.

# Copying to home path:

run:

```
./copy_dotfiles.sh
```

## Key combos (from https://www.tecmint.com/linux-command-line-bash-shortcut-keys/)

|Action|Command|
|------|-------|
|BOL|Ctrl-A|
|EOL|Ctrl-E|
|Forward one word|Alt-C|
|Backward one word|Alt-B|
|Delete to EOL|Ctrl-K|
|Delete to BOL|Ctrl-U|


## Windowing on Linux:

https://support.system76.com/articles/pop-shell

## install oh-my-zsh:

``sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"``

via: https://ohmyz.sh/#install

## Oh-my-zsh plugins install:

``sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"``

via: https://github.com/ohmyzsh/ohmyzsh

## Oh-my-zsh autocomplete:

``git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions``

via: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh

