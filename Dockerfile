FROM centos
MAINTAINER  Jin Zhuwei

WORKDIR /usr/local/freeswitch
#COPY ./freeswitch  /usr/local/freeswitch/
ADD package.tgz  /usr/local/
RUN yum install -y http://files.freeswitch.org/freeswitch-release-1-6.noarch.rpm epel-release && \
yum install -y git gcc-c++ autoconf automake libtool wget python ncurses-devel zlib-devel libjpeg-devel openssl-devel e2fsprogs-devel sqlite-devel libcurl-devel pcre-devel speex-devel ldns-devel libedit-devel libxml2-devel libyuv-devel opus-devel libvpx-devel libvpx2* libdb4* libidn-devel unbound-devel libuuid-devel lua-devel libsndfile-devel yasm-devel libtiff libtiff-devel bzip2  luarocks \
&& ln -sf /usr/local/freeswitch/bin/freeswitch /usr/bin/ \
&& ln -sf /usr/local/freeswitch/bin/fs_cli /usr/bin/ \
&& luarocks install luasocket \
&& luarocks install lua-cjson \
&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "/usr/local/lib/vad-check/lib" >> /etc/ld.so.conf \
&& echo "/usr/local/lib/speech-recognize/lib" >> /etc/ld.so.conf \
&& ldconfig \
&& yum clean all


ENTRYPOINT ["freeswitch"]
