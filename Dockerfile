FROM debian:stretch

RUN apt update && apt install -y git build-essential
RUN apt install -y autoconf libpcsclite-dev libusb-dev xutils-dev gengetopt help2man swig python-dev python-crypto libtool
RUN apt install -y pkg-config wget default-jdk maven pcscd scdaemon opensc

COPY build.sh .
RUN ./build.sh

RUN sed -i s/stretch/stable/ /etc/apt/sources.list && apt update && apt install -y gpg
RUN rm -rf /var/lib/apt/lists

RUN useradd -ms /bin/bash pgpcard

COPY start.sh .
CMD ./start.sh


