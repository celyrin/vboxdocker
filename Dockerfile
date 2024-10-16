FROM rockylinux/rockylinux:9

ENV container docker

RUN dnf -y install dnf-plugins-core && \
    dnf config-manager --set-enabled crb && \
    dnf clean all && \
    dnf makecache && \
    dnf -y update

RUN dnf install -y kernel-devel \
    kernel-headers \
    gcc \
    make \
    perl \
    kmod \
    procps-ng

RUN cd /etc/yum.repos.d/ \
    && curl -O https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo \
    && dnf install -y VirtualBox-6.1

RUN echo "root:password" | chpasswd

CMD ["/usr/sbin/init"]
