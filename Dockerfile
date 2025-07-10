# Base image Ubuntu 22.04
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt install software-properties-common -y && \
    dpkg --add-architecture i386 && \
    apt-get upgrade -y && \
    apt-get update && \
    apt install lib32gcc-s1

# Set timezone and locale
RUN ln -fs /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Install SteamCMD
RUN mkdir -p /steamcmd && \
    cd /steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm steamcmd_linux.tar.gz

RUN mkdir -p /valheim

# Install Valheim Dedicated Server
RUN /steamcmd/steamcmd.sh +login anonymous +force_install_dir /valheim +app_update 896660 validate +quit

WORKDIR /valheim

EXPOSE 2456/udp 2457/udp 2458/udp

# valheim entrypoint
CMD ["/valheim/valheim_server.x86_64", "-name", "MyServer", "-port", "2456", "-world", "CurrentWorld", "-password", "pass123", "-public", "1"]
CMD ["/bin/bash"]
