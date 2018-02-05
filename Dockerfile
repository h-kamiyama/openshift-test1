# ベースイメージの指定
FROM openshift/ubuntu:14.10

# 作者情報
MAINTAINER h-kamiyama h-kamiyama@keyportsolutions.com

# 必要なファイルのインストール
USER root
RUN apt-get update
RUN apt-get -y install apache2
COPY ./html /var/www/

# /etc/apache2/envvarsの中身
ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_PID_FILE=/var/run/apache2/apache2$SUFFIX.pid
ENV APACHE_RUN_DIR=/var/run/apache2$SUFFIX
ENV APACHE_LOCK_DIR=/var/lock/apache2$SUFFIX
ENV APACHE_LOG_DIR=/var/log/apache2$SUFFIX

EXPOSE 80

CMD /usr/sbin/apache2 -D FOREGROUND
