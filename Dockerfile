# ベースイメージの指定
FROM openshift/ubuntu:14.10

# 作者情報
MAINTAINER h-kamiyama h-kamiyama@keyportsolutions.com

# 必要なファイルのインストール
USER root
RUN sudo sed -i -e 's;utopic;trusty;g' /etc/apt/sources.list
RUN apt-get -o Acquire::http::proxy="http://proxy.fiosys.co.jp:8080" update
RUN apt-get -o Acquire::http::proxy="http://proxy.fiosys.co.jp:8080" -y install apache2
COPY ./html /var/www/
COPY ./run-apache2.sh /tmp/

# /etc/apache2/envvarsの中身
ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_PID_FILE=/var/run/apache2/apache2$SUFFIX.pid
ENV APACHE_RUN_DIR=/var/run/apache2$SUFFIX
ENV APACHE_LOCK_DIR=/var/lock/apache2$SUFFIX
ENV APACHE_LOG_DIR=/var/log/apache2$SUFFIX

EXPOSE 80

CMD /tmp/run-apache2.sh
