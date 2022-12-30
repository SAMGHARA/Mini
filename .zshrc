#!/bin/zsh

# zinit
if [ ! -d "${HOME}/.zinit" ]; then
  git clone https://github.com/zdharma-continuum/zinit.git ${HOME}/.zinit
  chsh -s /bin/zsh
fi

# zinit plugins
source $HOME/.zinit/zinit.zsh
zinit ice depth "1" && zinit light romkatv/powerlevel10k
zinit light mfaerevaag/wd
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zpcompinit

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go beloj.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# alias setting
typeset -A aliasKeyMap
aliasKeyMap=(
    ls      'ls --color'
    la      'ls -la --color'
    vst     'vim +StartupTime'
    vvi     'vim $HOME/.config/nvim/init.lua'
    vrc     'vim $HOME/.zshrc'
    src     'source $HOME/.zshrc'

    gr      'go run'

    gitus   'git status'
    gitash  'git stash'

    syyu    'sudo pacman -Syyu'
    qdtq    'sudo pacman -Rn $(sudo pacman -Qdtq)'
)
for k in "${(@k)aliasKeyMap}"; do
  alias ""$k""=""$aliasKeyMap[$k]""
done

# bindkey
typeset -A bindKeyMap
bindKeyMap=(
    "\e[1~"   beginning-of-line      # <HOME>
    "\e[4~"   end-of-line            # <END>
    "\e[3~"   delete-char            # <DELETE>

    # https://blog.csdn.net/z1w10281a/article/details/121488309
    "\eh"    backward-char
    "\ej"    down-line-or-history
    "\ek"    up-line-or-history
    "\el"    forward-char
)
for k in "${(@k)bindKeyMap}"; do
    bindkey ""$k"" ""$bindKeyMap[$k]""
done

setopt no_nomatch

# ignore <tab> completion case
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# zsh history file
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Environment Variable
export PATH=$PATH\
:$HOME/.local/bin\
:$HOME/.local/go/bin\
:$HOME/.local/redis/bin\

export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH\
:$HOME/.local/include\

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH\
:$HOME/.local/lib\
:$HOME/.local/boost/lib\
:$HOME/.local/hiredis/lib\

export LIBRARY_PATH=$LIBRARY_PATH\
:$HOME/.local/lib\
:$HOME/.local/boost/lib\
:$HOME/.local/hiredis/lib\
