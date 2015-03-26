.PHONY: symlink
symlink:
	ln -s $(realpath vim) ${HOME}/.vim; \
	ln -s $(realpath vimrc) ${HOME}/.vimrc;
