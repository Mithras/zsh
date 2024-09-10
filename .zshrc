fastfetch

# p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# completion
autoload -Uz compinit ; compinit
TRAPUSR1() { rehash }

# third-party
source "$ZDOTDIR/third-party.zsh"

# options
setopt no_beep
setopt append_history hist_find_no_dups hist_ignore_dups hist_reduce_blanks share_history

# styles
zstyle ':completion:*' menu no # select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# variables
HISTFILE="$ZDOTDIR/.histfile"
HISTSIZE=10000
SAVEHIST=10000
export FZF_DEFAULT_OPTS="--exact"
AUTO_NOTIFY_THRESHOLD=10
AUTO_NOTIFY_IGNORE+=("paru" "code")

# aliases
alias ls='ls --color --human-readable --group-directories-first --classify'

# bindings
source "$ZDOTDIR/bindings.zsh"

# p10k config
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"
