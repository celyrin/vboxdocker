FROM centos:6

# Configure repositories and update system
# RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo \
#     && yum clean all \
#     && yum makecache \
RUN yum -y update

# Install necessary packages
RUN yum install -y kernel-devel \
    kernel-headers \
    gcc \
    make \
    perl

# Add VirtualBox repository and install VirtualBox
RUN curl -o /etc/yum.repos.d/virtualbox.repo https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo \
    && yum install -y VirtualBox-6.1

# Set root password (Optional: remove this line if no password is required)
RUN echo "root:password" | chpasswd

# Command to run on container start
CMD ["/sbin/init"]
