# Acropolis platform - build via docker

```
                                  _ _
                                 | (_)
  __ _  ___ _ __ ___  _ __   ___ | |_ ___
 / _` |/ __| '__/ _ \| '_ \ / _ \| | / __|
| (_| | (__| | | (_) | |_) | (_) | | \__ \
 \__,_|\___|_|  \___/| .__/ \___/|_|_|___/
                     | |
                     |_|
```


There are two ways to build Acropolis via docker-compose.

1. Each service runs in dedicated container, linked on the same network

For further information on running containers, look through `docker-compose.yml`

> Build
`docker-compose build`

> Run
`docker-compose up`

2. All services running in single container

Alternatively, you can build the platform using [supervisor](http://supervisord.org/introduction.html).
This has been used to spin up platform for BDD testing, see `behave.yml` on `acropolis-bdd` image.

> Build
`docker-compose -f behave.yml build`

> Run
`docker-compose -f behave.yml up`

### Note:
Building on OSX, if the build fails on COPY then removing the .dockerignore file is the easiest way to resolve this.
https://github.com/docker/for-mac/issues/1922

# Services

Here are the different services you can run. You may run them all individualy
or use supervisord which is pre-configured to run an instance of each of them.
You can also use docker-compose to have each service running in a dedicated
container, as stated above.

## Spindle processing engine (you can start multiple of those)
```
/usr/sbin/twine-writerd -f
```

## Web crawler Anansi
```
/usr/sbin/crawld -f
```

## Connection between Anansi and Spindle
```
/usr/sbin/twine-writerd -c /usr/etc/twine-anansi.conf -f
```

## Linked Data frontend
```
/usr/sbin/apache2 -D FOREGROUND
```

## Remote control for externaly ingesting data via HTTP (used by Cucumber)
```
/usr/bin/python3 /usr/local/src/docker/remote.py
```

# Usage

## Ingesting some data as a dump
To ingest a NQuads dump do
```
/usr/bin/twine shakespeare-sample.nq
```
This bypasses Anansi and schedule a payload ready to be processed by the
processing engine Spindle (via the workflow engine Twine)

## Adding a URI to the queue
```
/usr/bin/crawler-add http://dbpedia.org/resource/Cardiff
```

## Adding an Nquad using the remote control
```
curl -X POST --header "Content-Type: text/x-nquads" --data-binary @shakespeare-sample.nq  http://localhost:8000/ingest
```

## Wipeout ingested data(if any) using remote control
```
curl -X POST http://localhost:8000/delete
```

## Monitoring if things are being processed
```
watch -n2 'docker exec acropolis_postgres_1 psql spindle postgres -c "SELECT COUNT(*), status FROM STATE GROUP BY status;"'
```
