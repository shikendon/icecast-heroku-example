FROM centos:7
MAINTAINER "John Smith" <your@email.com>
RUN yum -y update && yum clean all
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
RUN yum -y install icecast
RUN sed -ri "s/<bind-address>127.0.0.1<\/bind-address>/<bind-address>0.0.0.0<\/bind-address>/g" /etc/icecast.xml
CMD sed -ri "s/<port>8000<\/port>/<port>$PORT<\/port>/g" /etc/icecast.xml && /bin/icecast -c /etc/icecast.xml

