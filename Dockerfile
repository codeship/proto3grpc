FROM golang:1.4.2 
MAINTAINER peter.edge@gmail.com

RUN \
  apt-get update -y && \
  apt-get install -y \
    autoconf \
    automake \
    build-essential \
    git \
    libtool \
    unzip && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  wget https://codeload.github.com/google/protobuf/tar.gz/v3.0.0-alpha-3.1 && \
  tar xvzf v3.0.0-alpha-3.1 && \
  rm v3.0.0-alpha-3.1 && \
  cd protobuf-3.0.0-alpha-3.1 && \
  ./autogen.sh && \
  ./configure --prefix=/usr && \
  make && \
  make check && \
  make install && \
  cd - && \
  rm -rf protobuf-3.0.0-alpha-3.1

RUN \
  git clone https://github.com/grpc/grpc.git && \
  cd grpc && \
  git submodule update --init && \
  make && \
  make install

RUN \
  go get github.com/golang/protobuf/protoc-gen-go && \
  go get google.golang.org/grpc && \
  go get github.com/gengo/grpc-gateway/protoc-gen-grpc-gateway
