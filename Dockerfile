FROM centos:7

RUN echo -e "[nginx]\n\
name=nginx repo\n\
baseurl=http://nginx.org/packages/centos/7/\$basearch/\n\
gpgcheck=1\n\
enabled=1\n\
gpgkey=http://nginx.org/keys/nginx_signing.key\n\
\n\
[nginx-source]\n\
name=nginx source\n\
baseurl=http://nginx.org/packages/mainline/centos/7/SRPMS/\n\
gpgcheck=1\n\
enabled=0\n\
gpgkey=http://nginx.org/keys/nginx_signing.key" > /etc/yum.repos.d/nginx.repo && \
yum install -y nginx

RUN yum update -y && \
    yum install -y yum-cron

COPY yum-cron.conf /etc/yum/yum-cron.conf

CMD ["nginx", "-v"]
