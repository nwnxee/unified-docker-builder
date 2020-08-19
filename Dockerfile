FROM debian:buster-slim
LABEL maintainer "jakobknutsen@gmail.com"

RUN buildDeps="build-essential \
    git \
    ssh-client \
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
    libluajit-5.1-dev \
    dotnet-sdk-3.1" \
    installDeps="ca-certificates wget gpg" \
    && apt-get update \
    && apt-get install -y --no-install-recommends $installDeps \
    && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg \
    && wget -q https://packages.microsoft.com/config/debian/10/prod.list \
    && mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ \
    && mv prod.list /etc/apt/sources.list.d/microsoft-prod.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps \
    && apt-get clean \
    && rm -r /var/lib/apt/lists /var/cache/apt
