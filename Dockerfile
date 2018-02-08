# ベースイメージの指定
FROM centos:6.9

# 作者情報
MAINTAINER h-kamiyama h-kamiyama@keyportsolutions.com

# 必要なファイルのインストール
#USER root
RUN echo "proxy=http://proxy.fiosys.co.jp:8080" >> /etc/yum.conf
RUN yum -y update; yum clean all
RUN yum -y install httpd; yum clean all
COPY ./html /var/www/html/
COPY ./run-httpd.sh /tmp/
RUN chmod 755 /tmp/run-httpd.sh

EXPOSE 80

#CMD /tmp/run-httpd.sh
CMD /bin/bash
