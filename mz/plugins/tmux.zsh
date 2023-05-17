# Tmux
typeset -A tmuxAlias=( 
    tn      'tmux new -s'
    ta      'tmux attach -t'
    trns    'tmux rename-session'
    trnw    'tmux rename-window'
 )
addAlias tmuxAlias
