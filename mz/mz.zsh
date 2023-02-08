#!/bin/zsh

export MZ="$(cd $(dirname $0);pwd)"
export MINI="$MZ/.."

source "$MZ/configs/core.zsh"
source "$MZ/plugins/plugin.zsh"
source "$MZ/themes/theme.zsh"
