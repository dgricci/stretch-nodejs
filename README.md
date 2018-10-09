% Environnement NodeJS  
% Didier Richard  
% 2018/10/09

---

revision:
    - 1.0.0 : 2018/09/16 : node.js 8.11.4, yarn 1.9.4  
    - 1.1.0 : 2018/10/09 : node.js 8.12.0, yarn 1.10.1  

---

# Building #

```bash
$ docker build -t dgricci/nodejs:$(< VERSION) .
$ docker tag dgricci/nodejs:$(< VERSION) dgricci/nodejs:latest
```

## Behind a proxy (e.g. 10.0.4.2:3128) ##

```bash
$ docker build \
    --build-arg http_proxy=http://10.0.4.2:3128/ \
    --build-arg https_proxy=http://10.0.4.2:3128/ \
    -t dgricci/nodejs:$(< VERSION) .
$ docker tag dgricci/nodejs:$(< VERSION) dgricci/nodejs:latest
```

## Build command with arguments default values ##

```bash
$ docker build \
    --build-arg NPM_CONFIG_LOGLEVEL=info \
    --build-arg NODE_VERSION=8.12.0 \
    --build-arg YARN_VERSION=1.10.1 \
    --build-arg GULPCLI_VERSION=2.0.1 \
    --build-arg GRUNTCLI_VERSION=1.3.0 \
    -t dgricci/nodejs:$(< VERSION) .
$ docker tag dgricci/nodejs:$(< VERSION) dgricci/nodejs:latest
```

# Use #

See `dgricci/stretch` README for handling permissions with dockers volumes.

```bash
$ docker run --rm dgricci/nodejs:$(< VERSION)
v8.12.0
yarn versions v1.10.1
{ yarn: '1.10.1',
  http_parser: '2.8.0',
  node: '8.12.0',
  v8: '6.2.414.66',
  uv: '1.19.2',
  zlib: '1.2.11',
  ares: '1.10.1-DEV',
  modules: '57',
  nghttp2: '1.32.0',
  napi: '3',
  openssl: '1.0.2p',
  icu: '60.1',
  unicode: '10.0',
  cldr: '32.0',
  tz: '2017c' }
Done in 0.02s.
[16:35:33] CLI version 2.0.1
grunt-cli v1.3.0
```

## A shell to hide container's usage ##

As a matter of fact, typing the `docker run ...` long command is painfull !  
In the [bin directory, the nodejs.sh bash shell](bin/nodejs.sh)
can be invoked to ease the use of such a container. For instance (we suppose
that the shell script has been copied in a bin directory and is in the user's
PATH) :

```bash
$ cd whatever/bin
$ ln -s nodejs.sh nodejs
$ ln -s nodejs.sh node
$ ln -s nodejs.sh yarn
$ ln -s nodejs.sh npm
$ ln -s nodejs.sh gulp
$ ln -s nodejs.sh grunt
$ nodejs --version
v8.12.0
```

__Et voilà !__


_fin du document[^pandoc_gen]_

[^pandoc_gen]: document généré via $ `pandoc -V fontsize=10pt -V geometry:"top=2cm, bottom=2cm, left=1cm, right=1cm" -s -N --toc -o nodejs.pdf README.md`{.bash}

