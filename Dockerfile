FROM epitechcontent/epitest-docker:latest AS epitech-docker

MAINTAINER Maxime FARRUGIA

WORKDIR /workspace

COPY ./build_sources/bin/* /usr/bin

COPY ./build_sources/id_rsa.pub /root/.ssh/id_rsa.pub
COPY ./build_sources/id_rsa /root/.ssh/id_rsa

RUN dnf update -y
RUN dnf install -y bzip2 emacs vim
RUN wget --no-check-certificate http://install.ohmyz.sh -O - | sh

ENV LOGIN firstname.lastname@epitech.eu

RUN git config --global user.email $LOGIN
RUN git config --global user.name $LOGIN

