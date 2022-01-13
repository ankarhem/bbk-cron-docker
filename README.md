## About

A docker container for testing connection speed against bredbandskollen every 0th minute every hour.
Outputs the results in csv.

## Compose file

```
version: '2.7'
services:
  bbk:
    container_name: bbk
    image: idealpink/bbk-cron
    restart: unless-stopped
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /path/to/data:/data
```

Place the empty results.csv from the repo where you want
to store the csv and bind mount it into the container.
