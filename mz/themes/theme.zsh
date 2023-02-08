MZ_THEMES="$MZ/themes"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ -f "$MZ_THEMES/powerlevel10k/powerlevel10k.zsh-theme" ]] && source "$MZ_THEMES/powerlevel10k/powerlevel10k.zsh-theme"

[[ -f "$MZ_THEMES/p10k.zsh" ]] && source "$MZ_THEMES/p10k.zsh"

