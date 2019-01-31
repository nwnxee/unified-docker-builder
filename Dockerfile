FROM i386/debian:stretch-slim
LABEL maintainer "jakobknutsen@gmail.com"

RUN buildDeps="build-essential \
    zip \
    cmake \
    gperf \
    gcc-6 \
    g++-6 \
    default-libmysqlclient-dev \
    libpq-dev \
    libsqlite3-dev \
    libseccomp-dev \
    ruby-dev \
    libssl-dev \
    libhunspell-dev \
    pkg-config \
    libmono-2.0-dev:i386 \
    openjdk-8-jdk \
    ant \
    libluajit-5.1-dev" \
    && mkdir -p /usr/share/man/man1 \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps \
    && apt-get clean \
    && rm -r /var/lib/apt/lists /var/cache/apt
