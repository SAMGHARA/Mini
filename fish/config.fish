if status is-interactive
    set -U COLUMNS 20
    set -U fish_pager_columns 1

    # alias
    alias vvi "vim $XDG_CONFIG_HOME/nvim/init.lua"
    alias vrc "vim $XDG_CONFIG_HOME/fish/config.fish"
    alias src "source $XDG_CONFIG_HOME/fish/config.fish"

    alias lg "lazygit"
    alias tn "tmux new -s"
    alias ta "tmux attach -t"

    # source command keybindings
    if command -q zoxide
        zoxide init fish | source
    end

    if command -q fzf
        fzf --fish | source

        # set -gx FZF_COMPLETION_TRIGGER "~~"
        # set -gx FZF_DEFAULT_OPTS "--reverse --bind 'alt-j:down' --bind 'alt-k:up' --bind 'tab:accept' --bind 'ctrl-j:preview-down' --bind 'ctrl-k:preview-up'"
    end
end

function fish_prompt
    string join "" -- (set_color blue) (prompt_pwd --full-length-dirs 2) (set_color purple) " ❯ "
end

function fish_right_prompt
    echo -n (set_color "#5C6370") (date "+%H:%M")
end

function fish_user_key_bindings
    bind \el forward-char
end

function fish_greeting

end

set -U fish_complete_inline 1

# export environment
set -gx XDG_LOCAL_HOME "$HOME/.local"
set -gx XDG_CONFIG_HOME "$HOME/.config"

set -gx PATH "$XDG_LOCAL_HOME/bin" $PATH
set -gx PATH "$XDG_LOCAL_HOME/go/bin" $PATH
set -gx PATH "$XDG_LOCAL_HOME/rust/bin" $PATH

set -gx CPATH "$XDG_LOCAL_HOME/include" $CPATH
set -gx CPATH "$XDG_LOCAL_HOME/mysql/include" $CPATH
set -gx CPATH "$XDG_LOCAL_HOME/hiredis/include" $CPATH

set -gx LIBRARY_PATH "$XDG_LOCAL_HOME/lib" $LIBRARY_PATH
set -gx LIBRARY_PATH "$XDG_LOCAL_HOME/mysql/lib" $LIBRARY_PATH
set -gx LIBRARY_PATH "$XDG_LOCAL_HOME/hiredis/lib" $LIBRARY_PATH

set -gx LD_LIBRARY_PATH "$XDG_LOCAL_HOME/lib" $LD_LIBRARY_PATH
set -gx LD_LIBRARY_PATH "$XDG_LOCAL_HOME/mysql/lib" $LD_LIBRARY_PATH
set -gx LD_LIBRARY_PATH "$XDG_LOCAL_HOME/hiredis/lib" $LD_LIBRARY_PATH

set -gx CARGO_HOME  "$XDG_LOCAL_HOME/rust"
set -gx RUSTUP_HOME "$XDG_LOCAL_HOME/rust"
set -gx RUSTUP_DIST_SERVER "https://mirrors.ustc.edu.cn/rust-static"
set -gx RUSTUP_UPDATE_ROOT "https://mirrors.ustc.edu.cn/rust-static/rustup"

