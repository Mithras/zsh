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
alias meta-update='sudo dnf config-manager setopt cpe-yum-fb-runtime.enabled=0 && sudo dnf config-manager setopt cpe-yum-any.enabled=0 && sudo dnf config-manager setopt cpe-yum-any-noarch.enabled=0 && sudo dnf update --refresh && sudo dnf config-manager unsetopt cpe-yum-fb-runtime.enabled && sudo dnf config-manager unsetopt cpe-yum-any.enabled && sudo dnf config-manager unsetopt cpe-yum-any-noarch.enabled'
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias code-fb='code-fb --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias code-fb-insiders='code-fb-insiders --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias openvpn-mithras='sudo openvpn ~/Sync/pc/MithrasOpenVPN.ovpn'
alias ssh-ubuntu1='ssh 192.168.0.6 -l mithras'
alias ssh-mithras='ssh 192.168.0.2 -l mithras'
alias ssh-rpi01='ssh pi@raspberrypi01 -l mithras'
alias ssh-rpi02='ssh pi@raspberrypi02 -l mithras'
alias ssh-mithras-pc='ssh mithras@mithras-pc'
alias ssh-mithras-pc-new='ssh mithras@mithras-pc-new'
alias ssh-raspberrypi01='ssh 192.168.10.143 -l pi'
alias ssh-raspberrypi02='ssh 192.168.10.208 -l pi'
alias nmcli-list='nmcli -f in-use,ssid,bssid,freq,signal,bars dev wifi'

# bindings
source "$ZDOTDIR/bindings.zsh"

# p10k config
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"
