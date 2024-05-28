#!/bin/bash

MINI=$(cd "$(dirname "$0")" && pwd)

XDG_LOCAL_HOME="$HOME/.local"
XDG_CACHE_HOME="$HOME/.cache"
XDG_CONFIG_HOME="$HOME/.config"

function link() {
    [[ ! -e "$2" ]] && echo "ln -s $1 $2" && ln -s "$1" "$2"
}

function unlink() {
    [[ -h "$1" ]] && echo "rm $1" && rm "$1"
}

function install() {
    mkdir -p $XDG_LOCAL_HOME $XDG_CACHE_HOME $XDG_CONFIG_HOME

    link "$MINI/zsh/zshrc"        "$HOME/.zshrc"
    link "$MINI/gitconfig"        "$HOME/.gitconfig"
    link "$MINI/clang-format"     "$HOME/.clang-format"
    link "$MINI/nvim"             "$XDG_CONFIG_HOME/nvim"
    link "$MINI/tmux"             "$XDG_CONFIG_HOME/tmux"
    link "$MINI/fish"             "$XDG_CONFIG_HOME/fish"
}

function uninstall() {
    unlink "$HOME/.zshrc"
    unlink "$HOME/.gitconfig"
    unlink "$HOME/.clang-format"
    unlink "$XDG_CONFIG_HOME/nvim"
    unlink "$XDG_CONFIG_HOME/tmux"
    unlink "$XDG_CONFIG_HOME/fish"
}

case $1 in
    install|-i)
        install
        ;;
    uninstall|-u)
        uninstall
        ;;
    *)
        install
        ;;
esac


