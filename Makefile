FILES = zshrc tmux.conf clang-format
ORIGIN_PATH = ${HOME}/.config/nvim/others

default: install

install:
	@for file in ${FILES}; do\
		if [ ! -e ${HOME}/.$$file ]; then\
			echo "ln -s ${ORIGIN_PATH}/$$file ${HOME}/.$$file";\
			ln -s ${ORIGIN_PATH}/$$file ${HOME}/.$$file;\
		fi;\
	done
	@echo "Install Finished"

uninstall:
	@for file in ${FILES}; do\
		if [ -e ${HOME}/.$$file ]; then\
			echo "rm ${HOME}/.$$file";\
			rm ${HOME}/.$$file;\
		fi;\
	done
	@echo "Uninstall Finished"

.PHONY: install uninstall
