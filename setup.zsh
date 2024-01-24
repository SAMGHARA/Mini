#!/bin/zsh

ZSHRC="$HOME/.zshrc"
XDG_CONFIG_HOME="$HOME/.config"
NVIM="$XDG_CONFIG_HOME/nvim"

MINI_CONF="${0:A:h}/conf"
MINI_NVIM="${0:A:h}/nvim"
MINI_ZSHRC="${0:A:h}/zsh/zshrc"

CONFS=(
    "clang-format"
    "tmux.conf"
    "gitconfig"
)

function install() {
    # add "source $MINI_ZSHRC" to $ZSHRC
    [[ ! -e $ZSHRC || `grep -c "source $MINI_ZSHRC" $ZSHRC` == 0 ]] && {
        echo "echo \"source $MINI_ZSHRC\" >> $ZSHRC"
        echo "source $MINI_ZSHRC" >> $ZSHRC
    }

    # create symlink from $MINI_NVIM to $NVIM
    mkdir -p $XDG_CONFIG_HOME

    [[ ! -e $NVIM ]] && {
        echo "ln -s $MINI_NVIM $NVIM"
        ln -s $MINI_NVIM $NVIM
    }

    # create symlink for other dotfiles
    for conf (${CONFS}) {
        [[ ! -e "${HOME}/.${conf}" ]] && {
            echo "ln -s $MINI_CONF/$conf $HOME/.$conf"
            ln -s "$MINI_CONF/$conf" "$HOME/.$conf"
        }
    }

    echo "Install Finished"
}

function uninstall() {
    # remove "source $MINI_ZSHRC"
    [[ `grep -c "source $MINI_ZSHRC" $ZSHRC` != 0 ]] && {
        echo "sed -i '\,$MINI_ZSHRC,d' $ZSHRC"
        sed -i "\,$MINI_ZSHRC,d" $ZSHRC
    }

    # remove symlink $NVIM
	[[ -h $NVIM ]] && {
		echo "rm $NVIM" && rm $NVIM
	}

    # remove symlink other dotfiles
	for conf (${CONFS}) {
		[[ -h "${HOME}/.${conf}" ]] && {
			echo "rm ${HOME}/.${conf}"
			rm "${HOME}/.${conf}"
		}
	}

    echo "Uninstall Finished"
}

case $1 {
    (install || -i)
        install
        ;;
    (uninstall || -u)
        uninstall
        ;;
    (*)
        install
        ;;
}

