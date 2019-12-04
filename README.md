# QR Code

Docker container to run QR code generator (qrencode...).

## Example

Assuming that you have a file `foo.txt` in your current working directory that you want to convert into a QR code image `foo.png`:

### Mac/Linux

```
$ docker run --rm -it --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/tmp" thomasleplus/qrcode qrencode -l L -r /tmp/foo.txt -o /tmp/foo.png
```

### Windows

In `cmd`:

```
$ docker run --rm -it --net=none -v "%cd%:/tmp" thomasleplus/qrcode qrencode -l L -r /tmp/foo.txt -o /tmp/foo.png
```

In PowerShell:

```
$ docker run --rm -it --net=none -v "${PWD}:/tmp" thomasleplus/qrcode qrencode -l L -r /tmp/foo.txt -o /tmp/foo.png
```

## Help

To know more command line options of `qrencode`:

```
$ docker run --rm -it --net=none thomasleplus/qrcode qrencode -h
```
