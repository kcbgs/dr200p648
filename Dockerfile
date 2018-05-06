FROM debian:jessie
MAINTAINER Kei Sugibuchi <keiweroiu@gmail.com>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install \
    build-essential \
    curl \
    git-core \
    libcurl4-openssl-dev \
    libreadline-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libyaml-dev \
    zlib1g-dev && \
    curl -O http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p648.tar.gz && \
    tar -zxvf ruby-2.0.0-p648.tar.gz && \
    cd ruby-2.0.0-p648 && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -r ruby-2.0.0-p648 ruby-2.0.0-p648.tar.gz && \
    echo 'gem: --no-document' > /usr/local/etc/gemrc

# Install Bundler for each version of ruby
RUN \
  echo 'gem: --no-rdoc --no-ri' >> /.gemrc && \
  gem install bundler
