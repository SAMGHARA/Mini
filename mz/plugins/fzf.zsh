# FZF
if [[ ! -f "${MZ_PLUGINS[fzf]}/bin/fzf" ]] {
    # https://ghproxy.com
    sed -i 's/url=/url=https:\/\/ghproxy.com\//g' "${MZ_PLUGINS[fzf]}/install"
    ${MZ_PLUGINS[fzf]}/install --bin
    sed -i 's/https:\/\/ghproxy.com\///g' "${MZ_PLUGINS[fzf]}/install"
}

export FZF_COMPLETION_TRIGGER="\\"
export FZF_DEFAULT_OPTS="
--color bg+:#3E4452,border:#3E4452
--bind 'alt-j:down'
--bind 'alt-k:up'
--bind 'tab:accept'
--bind 'ctrl-j:preview-down'
--bind 'ctrl-k:preview-up'
--bind 'alt--:change-preview-window()'
--bind 'alt-=:change-preview-window(right,99%)'
"

# Setup fzf
if [[ ! "$PATH" == *${MZ_PLUGINS[fzf]}/bin* ]]; then
    PATH="${PATH:+${PATH}:}${MZ_PLUGINS[fzf]}/bin"
fi

# Auto-completion
[[ $- == *i* ]] && source "${MZ_PLUGINS[fzf]}/shell/completion.zsh" 2> /dev/null

# Key bindings
source "${MZ_PLUGINS[fzf]}/shell/key-bindings.zsh"


# Useful function
# https://github.com/junegunn/fzf/wiki/Examples
# -------------------------------------------------------------
# Select a docker container to start and attach to
function d-attach() {
    local cid
    cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# Get the colors in the opened man page itself
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always --color always --theme=\"Visual Studio Dark+\"'"

function fman() {
    batman="man {1} | $MANPAGER"
    man -k . | sort | awk '{$1 $1; $2;} 1' | fzf -q "$1" --ansi --tiebreak=begin --prompt=' Man > ' \
        --preview-window '50%,rounded,<50(up,85%,border-bottom)' \
        --preview "${batman}" --bind "enter:execute(man {1})"
}

# Install packages
function install() {
    pacman -Slq | fzf -q "$1" -m --preview 'pacman -Si {1}'| xargs -ro sudo pacman -S
}
# Uninstall packages
function uninstall() {
    pacman -Qq | fzf -q "$1" -m --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
}
