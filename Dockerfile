FROM golang:1.5.1
MAINTAINER peter.edge@gmail.com

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
  wget https://codeload.github.com/google/protobuf/tar.gz/v3.0.0-beta-3 && \
  tar xvzf v3.0.0-beta-3 && \
  rm v3.0.0-beta-3 && \
  cd protobuf-3.0.0-beta-3 && \
  wget https://github.com/google/googlemock/archive/release-1.7.0.zip && \
  unzip -q release-1.7.0.zip && \
  rm release-1.7.0.zip && \
  mv googlemock-release-1.7.0 gmock && \
  wget https://github.com/google/googletest/archive/release-1.7.0.zip && \
  unzip -q release-1.7.0.zip && \
  rm release-1.7.0.zip && \
  mv googletest-release-1.7.0 gmock/gtest && \
  ./autogen.sh && \
  ./configure --prefix=/usr && \
  make && \
  make check && \
  make install && \
  cd - && \
  rm -rf protobuf-3.0.0-beta-3

RUN \
  go get \
    github.com/golang/protobuf/proto \
    github.com/golang/protobuf/protoc-gen-go \
    google.golang.org/grpc \
    github.com/gengo/grpc-gateway/protoc-gen-grpc-gateway
