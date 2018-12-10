#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:18.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y apt-utils && \
  apt-get install -y build-essential subversion libncurses5-dev zlib1g-dev gawk gcc-multilib flex git-core gettext libssl-dev && \
  apt-get install -y device-tree-compiler && \
  apt-get install -y file wget cpio python unzip rsync bc && \
  apt-get install -y git && \
  apt-get install -y u-boot-tools bison && \
  # provide arm-linux-gnueabihf-gcc
  apt-get install -y binutils-arm-linux-gnueabihf g++-arm-linux-gnueabihf && \
  rm -rf /var/lib/apt/lists/*

# Add files.
# ADD root/.bashrc /root/.bashrc
# ADD root/.gitconfig /root/.gitconfig
# ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# RUN git clone https://github.com/Squonk42/buildroot-licheepi-zero.git
# WORKDIR /root/buildroot-licheepi-zero


# Define default command.
CMD ["bash"]

# make licheepi_zero_defconfig
# make source

# make -j30 V=s 2>&1 | tee build.log | grep -i '^error'

# docker run -it -v /home/logic/_workspace/kicad/PCBs/allwinner-v3s-tryout/software/buildroot-licheepi-zero:/root/buildroot-licheepi-zero logickee/licheepi-build:latest /bin/bash


# to delete
# make uboot-menuconfig
# make linux-menuconfig
# ln -s /usr/bin/arm-linux-gnueabihf-gcc /root/buildroot-licheepi-zero/output/host/bin/arm-linux-gnueabihf-gcc
# make busybox-menuconfig
