# Plugins
MZ_PLUGINS="$MZ/plugins"

PLUGINS_LIST=(
    "z.lua/z.lua.plugin.zsh"
    "extract/extract.plugin.zsh"
    "zsh-autosuggestions/zsh-autosuggestions.zsh"
    "zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    "zsh-completions/zsh-completions.plugin.zsh"
)

for PLUGIN (${PLUGINS_LIST}) {
    [[ -f $MZ_PLUGINS/$PLUGIN ]] && source "$MZ_PLUGINS/$PLUGIN"
}

# zsh-completions
autoload -Uz compinit && rm -f $HOME/.zcompdump && compinit
