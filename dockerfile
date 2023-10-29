FROM ubuntu:latest
COPY . .
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get -y update; apt-get -y upgrade
RUN apt-get -y install pdftk
RUN apt-get -y install ruby-full
RUN apt-get -y install ruby-safe-yaml
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get install -y texlive-xetex
RUN rm -rf /var/lib/apt/lists/*
RUN mv fontsneeded /usr/local/share/fonts
WORKDIR /sections
CMD ["ruby", "/sections/main.rb"]