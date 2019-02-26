FROM ruby:2.5.3-slim

ENV LANG C.UTF-8

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.tencentyun.com/debian/ jessie main non-free contrib" >/etc/apt/sources.list && \
    echo "deb http://mirrors.tencentyun.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.tencentyun.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.tencentyun.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list
RUN apt-get update -qq && apt-get install -y curl
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y git build-essential libpq-dev nodejs libsqlite3-dev ruby-mysql libmysqlclient-dev imagemagick yarn

RUN gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/
RUN gem install bundler --no-ri --no-rdoc
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org

CMD "bash"