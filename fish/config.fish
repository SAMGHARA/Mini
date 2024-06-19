function fish_prompt
    echo -n (set_color blue)(prompt_pwd)
    if command -sq git
        set branch (command git describe --contains --all HEAD 2>/dev/null)
        if not command git diff --quiet --exit-code 2>/dev/null
            echo -n (set_color red) $branch"*"
        else
            echo -n (set_color green) $branch
        end
    end
    echo -n (set_color purple)" ❯ "(set_color normal)
end

function fish_right_prompt
    if command -sq git
        set commit (command git rev-parse HEAD 2>/dev/null | string sub -l 7)
    end
    echo -n (set_color brblack) $commit (date "+%H:%M")(set_color normal)
end

# Welcome to fish
function fish_greeting
end

# keybinds
function fish_user_key_bindings
    bind \el forward-char   # <M-l>
end

function set_environment --description "export environment once"
    set -l env  $argv[1]
    set -l path $argv[2]
    if not contains -- $path $$env
        set -gx $env $path $$env
    end
end

set -gx XDG_LOCAL_HOME     "$HOME/.local"
set -gx XDG_CACHE_HOME     "$HOME/.cache"
set -gx XDG_CONFIG_HOME    "$HOME/.config"
set -gx TMUX_TMPDIR        "$XDG_CACHE_HOME"
set -gx CARGO_HOME         "$XDG_LOCAL_HOME/rust"
set -gx RUSTUP_HOME        "$XDG_LOCAL_HOME/rust"
set -gx RUSTUP_DIST_SERVER "https://mirrors.ustc.edu.cn/rust-static"
set -gx RUSTUP_UPDATE_ROOT "https://mirrors.ustc.edu.cn/rust-static/rustup"

# PATH
set_environment    PATH               "$XDG_LOCAL_HOME/bin"
set_environment    PATH               "$XDG_LOCAL_HOME/go/bin"
set_environment    PATH               "$XDG_LOCAL_HOME/rust/bin"
# CPATH
set_environment    CPATH              "$XDG_LOCAL_HOME/include"
set_environment    CPATH              "$XDG_LOCAL_HOME/mysql/include"
set_environment    CPATH              "$XDG_LOCAL_HOME/hiredis/include"
# LIBRARY_PATH
set_environment    LIBRARY_PATH       "$XDG_LOCAL_HOME/lib"
set_environment    LIBRARY_PATH       "$XDG_LOCAL_HOME/mysql/lib"
set_environment    LIBRARY_PATH       "$XDG_LOCAL_HOME/hiredis/lib"
# LD_LIBRARY_PATH
set_environment    LD_LIBRARY_PATH    "$XDG_LOCAL_HOME/lib"
set_environment    LD_LIBRARY_PATH    "$XDG_LOCAL_HOME/mysql/lib"
set_environment    LD_LIBRARY_PATH    "$XDG_LOCAL_HOME/hiredis/lib"

function zypperi --description "zypper in --no-recommends"
    set -l pkg (zypper --no-refresh se -u | awk -F '|' 'NR>5 {print $2}' | sed 's/ //g' | \
                fzf -q "$1" -m --preview "zypper --no-refresh info {1} | awk 'NR>6'")
    if test -n "$pkg"
        commandline -r "sudo zypper in --no-recommends $pkg"
    end
end

function zypperm --description "zypper rm --clean-deps"
    set -l pkg (zypper --no-refresh se -i | awk -F '|' 'NR>5 {print $2}' | sed 's/ //g' | \
                fzf -q "$1" -m --preview "zypper --no-refresh info {1} | awk 'NR>6'")
    if test -n "$pkg"
        commandline -r "sudo zypper rm --clean-deps $pkg"
    end
end

if status is-interactive
    set -U fish_complete_inline 1

    # alias
    alias vvi "vim $XDG_CONFIG_HOME/nvim/init.lua"
    alias vrc "vim $XDG_CONFIG_HOME/fish/config.fish"
    alias src "source $XDG_CONFIG_HOME/fish/config.fish"
    alias lg  "lazygit"

    function tn --description "tmux new session"
        if test -z $argv
            tmux new
        else
            tmux new -s $argv[1]
        end
    end

    function ta --description "tmux attach session"
        if test -z $argv
            tmux attach
        else
            tmux attach -t $argv[1]
        end
    end

    # source command keybindings
    if command -q zoxide
        zoxide init fish | source
    end

    if command -q fzf
        fzf --fish | source
        set -gx FZF_COMPLETION_TRIGGER "~~"
        set -gx FZF_DEFAULT_OPTS "--reverse --bind 'alt-j:down' --bind 'alt-k:up' --bind 'tab:accept' --bind 'ctrl-j:preview-down' --bind 'ctrl-k:preview-up'"
    end
end

