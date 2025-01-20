FROM docker.io/library/debian:12

RUN apt-get update && apt-get install -y locales \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get install -y abcde atomicparsley cdparanoia eject eyed3 flac glyrc imagemagick lame normalize-audio \
    && apt-get clean

RUN mkdir /output
VOLUME /output
WORKDIR /output

ENTRYPOINT ["abcde", "-p", "-P"]