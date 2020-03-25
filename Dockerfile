FROM centos:7.2.1511　　　　　　　　　　　　
MAINTAINER ym "529700260@qq.com"　　　
RUN yum -y update　　　 
RUN yum -y install openssh-server;yum clean all
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN /bin/echo 'root:123456'|chpasswd
RUN /bin/sed -i 's/.*session.*required.*pam_loginuid.so.*/session optional pam_loginuid.so/g' /etc/pam.d/sshd
RUN /bin/echo -e "LANG=\"en_US.UTF-8\"" > /etc/default/locale
EXPOSE 22  
RUN yum install -y https://files.freeswitch.org/repo/yum/centos-release/freeswitch-release-repo-0-1.noarch.rpm epel-release
RUN  yum install -y freeswitch-config-vanilla freeswitch-lang-* 
CMD /usr/sbin/sshd -D