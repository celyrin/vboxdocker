FROM rockylinux/rockylinux:9

ENV container docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN dnf -y install dnf-plugins-core && \
    dnf config-manager --set-enabled crb && \
    dnf clean all && \
    dnf makecache && \
    dnf -y update

RUN dnf install -y kernel-devel \
    kernel-headers \
    gcc \
    make \
    perl

RUN cd /etc/yum.repos.d/ \
    && curl -O https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo \
    && dnf install -y VirtualBox-6.1

RUN echo "root:password" | chpasswd

CMD ["/usr/sbin/init"]
