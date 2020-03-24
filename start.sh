#!/bin/bash
__run() {
  echo -e "123456\n123456" | (passwd)
  /usr/sbin/sshd -D
}

__start() {
  #程序名
  apt update 
  apt-get install  -y autoconf git libtool g++ zlib1g-dev libjpeg-dev libsqlite3-dev libcurl4-openssl-dev libpcre3-dev libspeex-dev libspeexdsp-dev libldns-dev libedit-dev libssl-dev pkg-config yasm liblua50-dev libopus-dev libsndfile1-dev libpq-dev libreadline-dev lua5.2 lua5.2-doc liblua5.2-dev libtiff5 libtiff5-dev
  
  RUN_NAME="$1"
  source /etc/profile

  echo "$RUN_NAME started success."
}

# Call all functions
__start $1
__run