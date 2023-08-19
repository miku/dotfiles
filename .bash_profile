stty -ixon # https://unix.stackexchange.com/a/72092/376

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Use GNU coreutils.
[ -d /usr/local/opt/coreutils/libexec/gnubin ] && export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $HOME/.{path,bash_prompt,exports,aliases,functions}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion).
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it.
shopt -s histappend

# Autocorrect typos in path names when using `cd`.
shopt -s cdspell

# Auto resize.
shopt -s checkwinsize

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
        shopt -s "$option" 2>/dev/null
done

# Add tab completion for many Bash commands.
if which brew &>/dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
        source "$(brew --prefix)/share/bash-completion/bash_completion"
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards.
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit.
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps.
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands.
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Homebrew version of bash completion.
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion

# rupa/z
[ -f "/usr/local/etc/profile.d/z.sh" ] && source "/usr/local/etc/profile.d/z.sh"
[ -f "$HOME/code/rupa/z/z.sh" ] && source "$HOME/code/rupa/z/z.sh"

# Ruby sanity via rbenv.
# command -v rbenv &> /dev/null; [[ $? -eq 0 ]] && eval "$(rbenv init -)"

# FZF!
# [ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

# command -v direnv &> /dev/null; [[ $? -eq 0 ]] && eval "$(direnv hook bash)"

# PyEnv.
command -v pyenv &>/dev/null
[[ $? -eq 0 ]] && eval "$(pyenv init -)"
# command -v pyenv &> /dev/null; [[ $? -eq 0 ]] && pyenv virtualenvwrapper

# ROOT (https://root.cern.ch/)
[ -f "/usr/local/bin/thisroot.sh" ] && source "/usr/local/bin/thisroot.sh"

command -v pandoc &>/dev/null
[[ $? -eq 0 ]] && eval "$(pandoc --bash-completion)"

[ -d "/usr/local/cuda-9.0/bin" ] && export PATH=/usr/local/cuda-9.0/bin${PATH:+:$PATH} && export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

[ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ] && source $HOME/anaconda3/etc/profile.d/conda.sh

# Jira completion, https://github.com/go-jira/jira
command -v jira &>/dev/null
[[ $? -eq 0 ]] && eval "$(jira --completion-script-bash)"

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{python,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Only source .python, if we have a pyenv.
[ -x "$(command -v pyenv)" ] && [ -r "$HOME/.python" ] && [ -f "$HOME/.python" ] && source "$HOME/.python"

# SDKMAN, https://sdkman.io
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# SPARK
[ -d "$HOME/opt/spark" ] && export SPARK_HOME="$HOME/opt/spark"
[ -d "$SPARK_HOME/bin" ] && export PATH="$PATH:$SPARK_HOME/bin"

[ -d "$HOME/code/so-fancy/diff-so-fancy" ] && export PATH="$PATH:$HOME/code/so-fancy/diff-so-fancy"

# atuin
# [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
# if is_interactive_shell; then
#         [[ -f ~/.bash-preexec.sh ]] && eval "$(atuin init bash)"
# fi
