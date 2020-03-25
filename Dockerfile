FROM centos:7.2.1511
MAINTAINER "ym" <yangmiao@529700260@qq.com.here>
ENV container docker
RUN yum -y update; yum clean all;


CMD ["/usr/sbin/init"]