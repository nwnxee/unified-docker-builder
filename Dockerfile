FROM debian:buster-slim
LABEL maintainer "jakobknutsen@gmail.com"

RUN buildDeps="build-essential \
    zip \
    cmake \
    gperf \
    gcc-7 \
    g++-7 \
    default-libmysqlclient-dev \
    libpq-dev \
    libsqlite3-dev \
    libseccomp-dev \
    ruby-dev \
    libssl-dev \
    libhunspell-dev \
    pkg-config \
    libluajit-5.1-dev" \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps \
    && apt-get clean \
    && rm -r /var/lib/apt/lists /var/cache/apt
