FROM ruby:2.4.2-slim

ENV LANG C.UTF-8

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.tencentyun.com/debian/ jessie main non-free contrib" >/etc/apt/sources.list && \
    echo "deb http://mirrors.tencentyun.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.tencentyun.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.tencentyun.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list
RUN apt-get update -qq && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y git build-essential libpq-dev nodejs yarn libsqlite3-dev ruby-mysql libmysqlclient-dev imagemagick

RUN gem install bundler  --no-ri --no-rdoc

CMD "bash"