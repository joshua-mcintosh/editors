.PHONY= symlink-vim

install: symlink-vim symlink-emacs

symlink-vim:
	@[ ! -h ${HOME}/.vim ] && \
		ln -s $(realpath vim) ${HOME}/.vim \
		|| echo "Link .vim exists";
	@[ ! -h ${HOME}/.vimrc ] && \
		ln -s $(realpath vimrc) ${HOME}/.vimrc \
		|| echo "Link .vimrc exists";

symlink-emacs:
	@[ ! -h ${HOME}/.emacs ] && \
		ln -s $(realpath emacs) ${HOME}/.emacs \
		|| echo "Link .emacs exists";
	@[ ! -h ${HOME}/.emacs.d ] && \
		ln -s $(realpath emacs.d) ${HOME}/.emacs.d \
		|| echo "Link .emacs.d exists";


clean: unlink-vim unlink-emacs

unlink-vim:
	@[ -h ${HOME}/.vim ] && rm ${HOME}/.vim;\
	[ -h ${HOME}/.vimrc ] && rm ${HOME}/.vimrc; \
	echo "Vim unlinked.";

unlink-emacs:
	@[ -h ${HOME}/.emacs ] && rm ${HOME}/.emacs; \
	[ -h ${HOME}/.emacs.d ] && rm ${HOME}/.emacs.d; \
	echo "Vim unlinked.";

