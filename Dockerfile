FROM golang:1.8.3

RUN \
  apt-get update -yq && \
  apt-get install -yq --no-install-recommends \
    autoconf \
    automake \
    build-essential \
    git \
    libtool \
    unzip && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  wget https://github.com/google/protobuf/archive/v3.4.0.tar.gz && \
  tar xvzf v3.4.0.tar.gz && \
  rm v3.4.0.tar.gz && \
  cd protobuf-3.4.0 && \
  ./autogen.sh && \
  ./configure --prefix=/usr && \
  make && \
  make check && \
  make install && \
  cd - && \
  rm -rf protobuf-3.4.0

RUN \
  go get \
    github.com/golang/protobuf/proto \
    github.com/golang/protobuf/protoc-gen-go \
    google.golang.org/grpc \
    github.com/gengo/grpc-gateway/protoc-gen-grpc-gateway
