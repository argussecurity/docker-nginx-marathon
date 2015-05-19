FROM nginx:latest

RUN apt-get -qqy update && apt-get -qqy install cron curl

ADD nginx-marathon-bridge /usr/app/

ENTRYPOINT ["/usr/app/nginx-marathon-bridge", "install_cronjob"]
