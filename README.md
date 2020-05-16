# QR Code

Docker container to run QR code generator (qrencode...).

![Docker Stars](https://img.shields.io/docker/stars/thomasleplus/qrcode.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/thomasleplus/qrcode.svg)
![Docker Automated](https://img.shields.io/docker/automated/thomasleplus/qrcode.svg)
![Docker Build](https://img.shields.io/docker/build/thomasleplus/qrcode.svg)

## Example without using the filesystem

Let's say that you have a file `foo.txt` in your current working directory that you want to convert into a QR code image `foo.png`:

### Mac/Linux

```
cat foo.txt | docker run --rm -i --net=none thomasleplus/qrcode qrencode -l L -o - > foo.png
```

### Windows

```
type foo.txt | docker run --rm -i --net=none thomasleplus/qrcode qrencode -l L -o - > foo.png
```

## Example using the filesystem

Same thing, assuming that you have a file `foo.txt` in your current working directory that you want to convert into a QR code image `foo.png`:

### Mac/Linux

```
docker run --rm -t --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/tmp" thomasleplus/qrcode qrencode -l L -r /tmp/foo.txt -o /tmp/foo.png
```

### Windows

In `cmd`:

```
docker run --rm -t --net=none -v "%cd%:/tmp" thomasleplus/qrcode qrencode -l L -r /tmp/foo.txt -o /tmp/foo.png
```

In PowerShell:

```
docker run --rm -t --net=none -v "${PWD}:/tmp" thomasleplus/qrcode qrencode -l L -r /tmp/foo.txt -o /tmp/foo.png
```

## Help

To know more command line options of `qrencode`:

```
docker run --rm --net=none thomasleplus/qrcode qrencode -h
```

## Request new tool

Please use [this link](https://github.com/thomasleplus/docker-qrcode/issues/new?assignees=thomasleplus&labels=enhancement&template=feature_request.md&title=%5BFEAT%5D) (GitHub account required) to request that a new tool be added to the image. I am always interested in adding new capabilities to these images.
