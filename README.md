# docker-nginx-marathon

Based on Nginx official image, with an added cron job to query specified Marathon instances and create upstreams.

The script is based on 'haproxy-marathon-bridge' from marathon's project (https://github.com/mesosphere/marathon/blob/master/bin/haproxy-marathon-bridge)


## Usage

docker run ... argussecurity/nginx-marathon <apps_regex> <marathon host:port>+

where 'apps_regex' is a regular expression to filter Marathon's tasks on (use "" for all).

example:  `docker run -d --net host argussecurity/nginx-marathon "play|node" localhost:8080`
