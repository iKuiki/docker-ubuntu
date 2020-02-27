FROM ubuntu:18.04

RUN apt-get update && apt-get install \
	vim \
	git \
	make \
	zsh \
	wget \
	curl \
	tzdata \
	-y && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)";exit 0
RUN chsh -s /bin/zsh
RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
WORKDIR /root
CMD zsh
