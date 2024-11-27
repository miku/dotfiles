# hello, dotfiles!

Minimal setup.

```
$ git clone git@github.com:miku/dotfiles.git ~/.dotfiles
```

Review files, commit, then sync with (will overwrite existing files):

```
~/install
```

Set default browser.

```
$ open -a "Firefox" --args --make-default-browser
```

On MacOS, run `.cask`, `.Brewfile` and `.macos`.

Add persistent changes to the repo first, then sync again. Put local extras
into `~/.extra` which will be sourced.

## Vim

Using [vim-plug](https://github.com/junegunn/vim-plug), need to install this
first, before we can `:PlugInstall` extras.

## pyenv

Use pyenv for Python version management. Use vanilla `-m venv` for venv
management, e.g. via `mkvenv` alias.

## Go and rust

Install default toolchains.

----

## SCP

```
echo "installing fonts at $PWD to ~/.fonts/"
mkdir -p ~/.fonts/adobe-fonts/source-code-pro
git clone https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
# find ~/.fonts/ -iname '*.ttf' -exec echo \{\} \;
fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
echo "finished installing"
```
