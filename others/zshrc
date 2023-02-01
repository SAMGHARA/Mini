#!/bin/zsh

XDG_LOCAL_HOME=$HOME/.local
XDG_CACHE_HOME=$HOME/.cache
XDG_CONFIG_HOME=$HOME/.config

# zsh history file
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Environment Variable
function addPATH() {
    [[ ${(P)1} != *$2* ]] && export $1=${(P)1}:$2
}

addPATH PATH $XDG_LOCAL_HOME/bin\
:$XDG_LOCAL_HOME/go/bin\
:$XDG_LOCAL_HOME/redis/bin\
:$XDG_LOCAL_HOME/node/node_modules/.bin

addPATH CPLUS_INCLUDE_PATH $XDG_LOCAL_HOME/include

addPATH LIBRARY_PATH $XDG_LOCAL_HOME/lib\
:$XDG_LOCAL_HOME/boost/lib\
:$XDG_LOCAL_HOME/hiredis/lib

addPATH LD_LIBRARY_PATH $LIBRARY_PATH

unfunction addPATH
########################################################################################

# zinit
if [[ ! -d "$XDG_CONFIG_HOME/zinit" ]]; then
    git clone git@github.com:zdharma-continuum/zinit.git $XDG_CONFIG_HOME/zinit
fi

source $XDG_CONFIG_HOME/zinit/zinit.zsh
zinit ice proto "ssh" depth "1" && zinit light romkatv/powerlevel10k
zinit ice proto "ssh" && zinit light zsh-users/zsh-completions
zinit ice proto "ssh" && zinit light zsh-users/zsh-autosuggestions
zinit ice proto "ssh" && zinit light zsh-users/zsh-syntax-highlighting
zpcompinit
########################################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
########################################################################################

# fzf
if [[ ! -d "$XDG_CONFIG_HOME/fzf" ]]; then
    git clone --depth 1 git@github.com:junegunn/fzf.git $XDG_CONFIG_HOME/fzf
    sed -i 's/url=/url=https:\/\/ghproxy.com\//g' $XDG_CONFIG_HOME/fzf/install
    $XDG_CONFIG_HOME/fzf/install
fi

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

export FZF_COMPLETION_TRIGGER='\'
export FZF_DEFAULT_OPTS="--bind 'alt-j:down,alt-k:up,tab:accept'"
########################################################################################

# zoxide
# sudo pacman -S zoxide
which "zoxide" >/dev/null 2>&1
[[ $? == 0 ]] && eval "$(zoxide init zsh)"
########################################################################################

# alias setting
typeset -A aliasKeyMap
aliasKeyMap=(
    ls      'ls --color'
    la      'ls -la --color'
    cd      'z'
    rr      'rm -r'

    # vim alias
    vst     'vim +StartupTime'
    vvi     'vim $XDG_CONFIG_HOME/nvim/init.lua'
    vrc     'vim $XDG_CONFIG_HOME/nvim/.others/.zshrc'
    vtm     'vim $XDG_CONFIG_HOME/nvim/.others/.tmux.conf'
    src     'source $XDG_CONFIG_HOME/nvim/.others/.zshrc'

    # tmux alias
    tn      'tmux new -s'
    ta      'tmux attach -t'

    # tar alias
    tgz     'tar -zcvf'
    tugz    'tar -zxvf -C'
    tbz2    'tar -cjf'
    tubz2   'tar -xjf -C'

    gr      'go run'

    gitus   'git status'
    gitash  'git stash'

    syyu    'sudo pacman -Syyu'
    qdtq    'sudo pacman -Rn $(sudo pacman -Qdtq)'
)
for k in "${(@k)aliasKeyMap}"; do
    alias ""$k""=""$aliasKeyMap[$k]""
done
########################################################################################

# bindkey
typeset -A bindKeyMap
bindKeyMap=(
    "\e[1~"   beginning-of-line       # <home>
    "\e[4~"   end-of-line             # <end>
    "\e[3~"   delete-char             # <delete>

    # https://blog.csdn.net/z1w10281a/article/details/121488309
    "\eh"    backward-char            # <left>
    "\ej"    down-line-or-history     # <down>
    "\ek"    up-line-or-history       # <up>
    "\el"    forward-char             # <right>
)
for k in "${(@k)bindKeyMap}"; do
    bindkey ""$k"" ""$bindKeyMap[$k]""
done
########################################################################################

setopt no_nomatch
setopt rmstarsilent

# ignore <tab> completion case
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

