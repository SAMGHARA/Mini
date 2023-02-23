# Plugins
autoload -Uz compinit && compinit

typeset -A MZ_PLUGINS=(
    fzf                      "${0:A:h}/fzf"
    z_lua                    "${0:A:h}/z.lua"
    extract                  "${0:A:h}/extract"
    zsh_completions          "${0:A:h}/zsh-completions"
    zsh_autosuggestions      "${0:A:h}/zsh-autosuggestions"
    zsh_syntax_highlighting  "${0:A:h}/zsh-syntax-highlighting"
)

# z.lua
# ----------------------------------
if [[ -f "${MZ_PLUGINS[z_lua]}/z.lua.plugin.zsh" ]] {
    _ZL_NO_ALIASES=1
    source "${MZ_PLUGINS[z_lua]}/z.lua.plugin.zsh"

    typeset -A zalias=(
        zz      "z -I"
        zb      "z -b"
    )
    addAlias zalias
}

# extract
# ----------------------------------
[[ -f "${MZ_PLUGINS[extract]}/extract.plugin.zsh" ]] && \
    source "${MZ_PLUGINS[extract]}/extract.plugin.zsh"

# fzf
# ----------------------------------
if [[ ! -f "${MZ_PLUGINS[fzf]}/bin/fzf" ]] {
    # https://ghproxy.com
    sed -i 's/url=/url=https:\/\/ghproxy.com\//g' "${MZ_PLUGINS[fzf]}/install"
    ${MZ_PLUGINS[fzf]}/install --bin
    sed -i 's/https:\/\/ghproxy.com\///g' "${MZ_PLUGINS[fzf]}/install"
}

if [[ -f "${MZ_PLUGINS[fzf]}/bin/fzf" ]] {
    export FZF_COMPLETION_TRIGGER="\\"
    export FZF_DEFAULT_OPTS="--bind 'alt-j:down,alt-k:up,tab:accept'"

    # Setup fzf
    if [[ ! "$PATH" == *${MZ_PLUGINS[fzf]}/bin* ]]; then
        PATH="${PATH:+${PATH}:}${MZ_PLUGINS[fzf]}/bin"
    fi

    # Auto-completion
    [[ $- == *i* ]] && source "${MZ_PLUGINS[fzf]}/shell/completion.zsh" 2> /dev/null

    # Key bindings
    source "${MZ_PLUGINS[fzf]}/shell/key-bindings.zsh"
}

# zsh-completions
# run `compinit` manual
# ----------------------------------
[[ -f "${MZ_PLUGINS[zsh_completions]}/zsh-completions.plugin.zsh" ]] && \
    source "${MZ_PLUGINS[zsh_completions]}/zsh-completions.plugin.zsh"

# zsh-autosuggestions
# ----------------------------------
[[ -f "${MZ_PLUGINS[zsh_autosuggestions]}/zsh-autosuggestions.zsh" ]] && \
    source "${MZ_PLUGINS[zsh_autosuggestions]}/zsh-autosuggestions.zsh"

# zsh-syntax-highlighting
# ----------------------------------
[[ -f "${MZ_PLUGINS[zsh_syntax_highlighting]}/zsh-syntax-highlighting.zsh" ]] && \
    source "${MZ_PLUGINS[zsh_syntax_highlighting]}/zsh-syntax-highlighting.zsh"
