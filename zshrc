# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of zsh theme to load.
ZSH_THEME="my_theme"

# Plugins for zsh.
plugins=(git tmux mvn tmuxinator brew osx kubectl sublime colorize gradle go vi-mode web-search zsh_reload z vagrant zsh-syntax-highlighting history-substring-search)

source ~/.zsh/colors.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/secrets.zsh

# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Initiate oh-my-zsh.
source $ZSH/oh-my-zsh.sh

alias -s md=nvim # suffix alias
zstyle ':completion:*:cd:*' ignore-parents parent pwd # cd will never select the parent directory
# ternjs settings to load file eagerly
ulimit -n 2048
[[ -s "$HOME/.tug/scripts/tug" ]] && source "$HOME/.tug/scripts/tug"
