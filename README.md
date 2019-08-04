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
