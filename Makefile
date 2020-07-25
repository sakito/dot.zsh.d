# 初回セットアップ用スクリプト

CWD=$(shell pwd)

.PHONY: all
all:
	@echo HOME = ${HOME}
	@echo CWD = ${CWD}

.PHONY: dotfiles
dotfiles:
	ln -sf ${CWD}/dotfiles/gitconfig ${HOME}/.gitconfig
	[ -d ${HOME}/.config/git ] || mkdir -p ${HOME}/.config/git
	ln -sf ${CWD}/dotfiles/gitignore ${HOME}/.config/git/ignore
	ln -sf ${CWD}/dotfiles/pip ${HOME}/.pip
	ln -sf ${CWD}/dotfiles/pythonrc.py ${HOME}/.pythonrc.py
	ln -sf ${CWD}/dotfiles/tmux.conf ${HOME}/.tmux.conf
	ln -sf ${CWD}/zsh.d ${HOME}/.zsh.d
	ln -sf ${CWD}/zlogin ${HOME}/.zlogin
	ln -sf ${CWD}/zshrc ${HOME}/.zshrc

.PHONY: brewinstall
brewinstall:
	brew install autoconf automake
	brew install coreutils findutils
	brew install texinfo
	brew install readline ncurses
	brew install gawk gnu-sed gauche go
	brew install zsh zsh-completions
	brew install git cmake
	brew install tmux reattach-to-user-namespace
	brew install hdf5 icu4c xz
	brew install wget ffmpeg imagemagick peco

.PHONY: pipinstall
pipinstall:
	curl -O https://raw.github.com/pypa/virtualenv/develop/virtualenv.py
	python virtualenv.py --distribute -p /usr/local/bin/python ${HOME}/local
	source ${HOME}/local/bin/activate
	pip -r requirements.txt

# end
