FROM ubuntu:jammy-20220101
LABEL maintainer="Jakob Ankarhem <jakob.ankarhem@outlook.com>"

RUN apt-get clean all \
  && apt-get update -y -q \
  && apt-get -y -q install \
  curl \
  cron

RUN curl -o bbk_cli http://frontend.bredbandskollen.se/download/bbk_cli_linux_amd64-1.0
RUN chmod +x bbk_cli
RUN echo "7e6db469095087e1c3d4ed3c49fcdb5c bbk_cli" | md5sum -c -
RUN mv bbk_cli /usr/bin/

COPY . .

RUN crontab /crontab
RUN touch /var/log/cron.log
RUN mkdir -p /data

CMD /boot.sh