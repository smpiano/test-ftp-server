FROM ubuntu:bionic

RUN mkdir /opt/project
WORKDIR /opt/project

RUN apt-get -qqy update && apt-get install -qqy vim vsftpd iproute2

# set a volume to share
# VOLUME ["/home/matu/Downloads/win:/home/sermapi"]

ENV IP_ADDR=127.0.0.1
ENV BANNER="Welcome to ==== FTP ==== service."


# creates sermapi user
# RUN adduser --home /home/sermapi --gecos "" --disabled-password sermapi
RUN useradd -m -d /home/sermapi sermapi
COPY custom.conf /etc/vsftpd.conf.template
RUN ( echo "cat <<EOF" ; cat /etc/vsftpd.conf.template; echo EOF  ) | sh > /etc/vsftpd.conf \
  && rm -f /etc/vsftpd.conf.template

CMD passwd sermapi && service vsftpd start; tail -f /var/log/*

EXPOSE 20 21

