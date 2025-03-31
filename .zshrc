# Exports
export MOZ_ENABLE_WAYLAND=1
export "MICRO_TRUECOLOR=1"

export PATH="$PATH:/home/emilj00/.dotnet/tools"
export PATH=$PATH:/home/emilj00/.local/bin
export PATH="$HOME/.cargo/bin:$PATH"

export EDITOR="/usr/bin/micro"

# Source aliases and theme
source ~/.zsh-aliases.zsh
source ~/.zsh-catppuccin-theme.zsh


# Set zinit location
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"


# Download Zinit, if it's not
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Plugins
zinit ice depth=1

zinit light Aloxaf/fzf-tab

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
unset LS_COLORS


# Keybinds
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

bindkey '^H' backward-kill-word

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config ~/.oh-my-posh.json)"


# Load Angular CLI autocompletion.
source <(ng completion script)
