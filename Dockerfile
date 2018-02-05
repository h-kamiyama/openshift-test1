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

EXPOSE 80

CMD /tmp/run-apache2.sh
