FROM nginx:latest

RUN apt-get -qqy update && apt-get -qqy install cron curl supervisor

ADD supervisord.conf /etc/supervisor/conf.d/
ADD nginx-marathon-bridge /usr/bin/
ADD inject-and-run /usr/bin/

ENTRYPOINT ["/bin/bash", "-e"]
CMD inject-and-run override_this localhost:8080
