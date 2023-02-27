#!/bin/zsh

ZSHRC="${HOME}/.zshrc"
XDG_CONFIG_HOME="${HOME}/.config"
NVIM_HOME="$XDG_CONFIG_HOME/nvim"

typeset -A MINI=(
    MZ     "${0:A:h}/mz"
    NVIM   "${0:A:h}/nvim"
    OTHERS "${0:A:h}/others"
)

OTHER_LINKS=(
    "clang-format"
    "tmux.conf"
    "gitconfig"
)

function install() {
    # Add "source Mini/mz/mz.zsh" to ~/.zshrc
    if [[ ! -e ${ZSHRC} || `grep -c "source ${MINI[MZ]}/mz.zsh" ${ZSHRC}` == 0 ]] {
        echo "echo \"source ${MINI[MZ]}/mz.zsh\" >> ${ZSHRC}"
        echo "source ${MINI[MZ]}/mz.zsh" >> ${ZSHRC}
    }

    # Link Mini/nvim to ${XDG_CONFIG_HOME}/nvim
    [[ ! -d ${XDG_CONFIG_HOME} ]] && mkdir ${XDG_CONFIG_HOME}

    if [[ ! -e ${NVIM_HOME} ]] {
        echo "ln -s ${MINI[NVIM]} ${NVIM_HOME}"
        ln -s ${MINI[NVIM]} ${NVIM_HOME}
    }

    # Link Mini/others/* to ~/*
    for file (${OTHER_LINKS}) {
        if [[ ! -e "${HOME}/.${file}" ]] {
            echo "ln -s ${MINI[OTHERS]}/${file} ${HOME}/.${file}"
            ln -s "${MINI[OTHERS]}/${file}" "${HOME}/.${file}"
        }
    }

    echo "Install Finished"
}

function uninstall() {
    if [[ `grep -c "source ${MINI[MZ]}/mz.zsh" ${ZSHRC}` != 0 ]] {
        echo "sed -i \"/Mini\/mz\/mz.zsh/d\" ${ZSHRC}"
        sed -i "/Mini\/mz\/mz.zsh/d" ${ZSHRC}
    }

	if [[ -h ${NVIM_HOME} ]] {
		echo "rm ${NVIM_HOME}"
		rm ${NVIM_HOME}
	}

	for file (${OTHER_LINKS}) {
		if [[ -h "${HOME}/.${file}" ]] {
			echo "rm ${HOME}/.${file}"
			rm "${HOME}/.${file}"
		}
	}

    echo "Uninstall Finished"
}

case $1 {
    (install)
        install
        ;;
    (uninstall)
        uninstall
        ;;
    (*)
        install
        ;;
}

