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
export FZF_DEFAULT_OPTS="--exact --ignore-case"
AUTO_NOTIFY_THRESHOLD=10
AUTO_NOTIFY_IGNORE+=("paru" "code")

# aliases
alias ls='lsd --human-readable --group-directories-first --classify'
alias zsh-config="code $ZDOTDIR"
alias zsh-bench="$THIRD_PARTY/zsh-bench/zsh-bench"
alias meta-lighthouse='nmcli connection up lighthouse passwd-file lighthouse'
alias meta-vpn='secret-tool lookup setting-name 802-1x ; nmcli connection up FB-VPN --ask'
alias brave-browser='brave-browser --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias brave-browser-stable='brave-browser-stable --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias google-chrome='google-chrome --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias google-chrome-stable='vs  --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias code-fb='code-fb --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias code-fb-insiders='code-fb-insiders --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias openvpn-mithras='sudo openvpn ~/Sync/pc/MithrasOpenVPN.ovpn'
alias ssh-ubuntu1='ssh 192.168.0.6 -l mithras'
alias ssh-mithras='ssh 192.168.0.2 -l mithras'

# bindings
source "$ZDOTDIR/bindings.zsh"

# p10k config
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"
