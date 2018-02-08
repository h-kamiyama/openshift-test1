# ベースイメージの指定
FROM centos:6

# 作者情報
MAINTAINER h-kamiyama h-kamiyama@keyportsolutions.com

# 必要なファイルのインストール
USER root
RUN echo "proxy=http://proxy.fiosys.co.jp:8080" >> /etc/yum.conf
RUN yum clean all
RUN yum update
RUN yum -y install httpd
COPY ./html /var/www/html/
COPY ./run-apache2.sh /tmp/
RUN chmod 755 /tmp/run-apache2.sh

EXPOSE 80

#CMD /tmp/run-apache2.sh
CMD /sbin/bash
