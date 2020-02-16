FROM debian:stretch

RUN apt update && apt install -y git build-essential
RUN apt install -y autoconf libpcsclite-dev libusb-dev xutils-dev gengetopt help2man swig python-dev python-crypto libtool
RUN apt install -y pkg-config wget default-jdk maven pcscd scdaemon opensc

COPY build.sh .
RUN ./build.sh

RUN echo "deb http://deb.debian.org/debian testing main" > /etc/apt/sources.list && apt update && apt install -y gpg wget secure-delete hopenpgp-tools paperkey curl locales locales-all \
	&& rm -rf /var/lib/apt/lists

RUN useradd -ms /bin/bash pgpcard && su pgpcard -c "mkdir /home/pgpcard/.gnupg" && chmod 700 /home/pgpcard/.gnupg

COPY gpg.conf /home/pgpcard/.gnupg/

ENV LANG en_DK.UTF-8
ENV LANGUAGE en_DK.UTF-8
ENV LC_ALL en_DK.UTF-8

COPY start.sh .
CMD ./start.sh


