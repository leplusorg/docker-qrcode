# QR Code

Docker container to run QR code generator (qrencode...).

[![Docker Build](https://github.com/leplusorg/docker-qrcode/workflows/Docker/badge.svg)](https://github.com/leplusorg/docker-qrcode/actions?query=workflow:"Docker")
[![Docker Stars](https://img.shields.io/docker/stars/leplusorg/qrcode)](https://hub.docker.com/r/leplusorg/qrcode)
[![Docker Pulls](https://img.shields.io/docker/pulls/leplusorg/qrcode)](https://hub.docker.com/r/leplusorg/qrcode)
[![Docker Automated](https://img.shields.io/docker/cloud/automated/leplusorg/qrcode)](https://hub.docker.com/r/leplusorg/qrcode)
[![Docker Build](https://img.shields.io/docker/cloud/build/leplusorg/qrcode)](https://hub.docker.com/r/leplusorg/qrcode)
[![Docker Version](https://img.shields.io/docker/v/leplusorg/qrcode?sort=semver)](https://hub.docker.com/r/leplusorg/qrcode)

## Example without using the filesystem

Let's say that you have a file `foo.txt` in your current working directory that you want to convert into a QR code image `foo.png`:

**Mac/Linux**

```bash
cat foo.txt | docker run --rm -i --net=none leplusorg/qrcode qrencode -l L -o - > foo.png
```

**Windows**

```batch
type foo.txt | docker run --rm -i --net=none leplusorg/qrcode qrencode -l L -o - > foo.png
```

## Example using the filesystem

Same thing, assuming that you have a file `foo.txt` in your current working directory that you want to convert into a QR code image `foo.png`:

**Mac/Linux**

```bash
docker run --rm -t --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/tmp" leplusorg/qrcode qrencode -l L -r /tmp/foo.txt -o /tmp/foo.png
```

**Windows**

In `cmd`:

```batch
docker run --rm -t --net=none -v "%cd%:/tmp" leplusorg/qrcode qrencode -l L -r /tmp/foo.txt -o /tmp/foo.png
```

In PowerShell:

```pwsh
docker run --rm -t --net=none -v "${PWD}:/tmp" leplusorg/qrcode qrencode -l L -r /tmp/foo.txt -o /tmp/foo.png
```

## Help

To know more command-line options of `qrencode`:

```bash
docker run --rm --net=none leplusorg/qrcode qrencode -h
```

## Request new tool

Please use [this link](https://github.com/leplusorg/docker-qrcode/issues/new?assignees=thomasleplus&labels=enhancement&template=feature_request.md&title=%5BFEAT%5D) (GitHub account required) to request that a new tool be added to the image. I am always interested in adding new capabilities to these images.
