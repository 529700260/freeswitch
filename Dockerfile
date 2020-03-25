FROM centos:7.2.1511
MAINTAINER "ym" <yangmiao@529700260@qq.com.here>
ENV container docker
RUN yum -y update; yum clean all;
RUN   yum install wget ;\
   wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo    ; \
   yum cleal all ;\
   yum install openssh-server  ;\


CMD ["/usr/sbin/init"]