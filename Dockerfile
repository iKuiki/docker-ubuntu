FROM ubuntu:16.04

COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install \
	vim \
	git \
	make \
	zsh \
	wget \
	curl \
	-y && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
COPY kuishell.zsh-theme /root/.oh-my-zsh/themes/
