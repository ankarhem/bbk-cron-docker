## About

A docker container for testing connection speed against bredbandskollen every 0th minute every hour.
Outputs the results in csv. Have this running

## Compose file

```
services:
  bbk:
    container_name: bbk
    image: idealpink/bbk-cron
    restart: unless-stopped
    volumes:
      - /path/to/results.csv:/results.csv
```

Place the empty results.csv from the repo where you want
to store the csv and bind mount it into the container.
