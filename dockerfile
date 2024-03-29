FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk curl
RUN curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | \
    gzip -d > cs && chmod +x cs && ./cs setup -y
RUN ./cs install sbt
ENV PATH="$PATH:/root/.local/share/coursier/bin"