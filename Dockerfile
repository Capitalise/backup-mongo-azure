FROM debian:stable

RUN apt update
RUN apt install -y lsb-release gnupg2 curl mongodb-clients cron

RUN AZ_REPO=$(lsb_release -cs) && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" > /etc/apt/sources.list.d/azure-cli.list

RUN apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893

RUN apt install -y apt-transport-https
RUN apt update && apt install -y azure-cli

ENV MONGO_PORT 27017
ADD start.sh /etc/cron.daily/start
RUN chmod 0755 /etc/cron.daily/start


ENTRYPOINT ["cron", "-f"]
