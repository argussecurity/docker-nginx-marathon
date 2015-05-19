# docker-nginx-marathon

Based on Nginx official image, with an added cron job to query specified Marathon instances and create upstreams.

The script is based on 'haproxy-marathon-bridge' from marathon's project (https://github.com/mesosphere/marathon/blob/master/bin/haproxy-marathon-bridge)


## Usage

`docker run ... argussecurity/nginx-marathon <apps_regex> <marathon host:port>+`

where <apps_regex> is a regular expression to filter Marathon's tasks on (use "" for all).


## Example

`docker run -d --net host argussecurity/nginx-marathon "play|node" localhost:8080`

Will do the following:

1. Create a cron job to run 'nginx-marathon-bridge' script every 1 minute.
    The script generates a file named 'sites.conf' in /etc/nginx/conf.c/
    The file will contain all tasks queried from Marathon that match the given regex ("play|node")
    as upstreams, for example:
    ```
    upstream play-server {
        server some_route:some_port;
        # ...
    }
    upstream node-server {
        server some_route:some_port;
        # ...
    }
    ```

3. Run nginx as in the official nginx docker (nginx -g "daemon off;")
