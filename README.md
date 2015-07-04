# Table of Contents

- [Introduction](#introduction)
- [Contributing](#contributing)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Data Store](#data-store)
- [Shell Access](#shell-access)
- [Upgrading](#upgrading)

# Introduction

This is a fork of [sameersbn/docker-bind](https://github.com/sameersbn/docker-bind) to allow all configs to be given as environment variables.

# Installation

Pull the latest version of the image from the docker index. This is the recommended method of installation as it is easier to update image in the future. These builds are performed by the **Docker Trusted Build** service.

```
docker pull ekesken/bind:latest
```

Alternately you can build the image yourself.

```
git clone https://github.com/ekesken/docker-bind.git
cd docker-bind
docker build -t="$USER/bind" .
```

# Quick Start

```bash
DOCKER_BIND=$(docker run -it \
  -e FORWARDERS="8.8.8.8;" \
  -e DNSSEC_VALIDATION=auto \
  -p 53:53/udp \
  ekesken/bind)
```

check if all is good with

`docker logs $DOCKER_BIND`

# Upgrading

To upgrade to newer releases, simply follow this 3 step upgrade procedure.

- **Step 1**: Update the docker image.

```
docker pull ekesken/bind:latest
```

- **Step 2**: Stop the currently running image

```
docker stop bind
```

- **Step 3**: Start the image

```
docker run -name bind -d [OPTIONS] ekesken/bind:latest
```
