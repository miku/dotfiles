Dotfiles
========

Minimal setup.

```
$ git clone git@github.com:miku/dotfiles.git ~/.dotfiles
```

Review files, commit, then sync with:

```
~/.dotfiles/bootstrap.sh -f
```

Set default browser.

```
$ open -a "Firefox" --args --make-default-browser
```

On MacOS, run `.cask`, `.Brewfile` and `.macos`.

Post-install
------------

*Ruby*

Install a current ruby via `rbenv`.

*LaTeX*

```
brew cask install mactex
```

TODO
----

* Python and Jupyter
* Android, iOS, Xcode
