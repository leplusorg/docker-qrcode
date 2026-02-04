# QR Code

Multi-platform Docker container with utilities to process QR codes (`qrencode`...).

[![Dockerfile](https://img.shields.io/badge/GitHub-Dockerfile-blue)](qrcode/Dockerfile)
[![Docker Build](https://github.com/leplusorg/docker-qrcode/workflows/Docker/badge.svg)](https://github.com/leplusorg/docker-qrcode/actions?query=workflow:"Docker")
[![Docker Stars](https://img.shields.io/docker/stars/leplusorg/qrcode)](https://hub.docker.com/r/leplusorg/qrcode)
[![Docker Pulls](https://img.shields.io/docker/pulls/leplusorg/qrcode)](https://hub.docker.com/r/leplusorg/qrcode)
[![Docker Version](https://img.shields.io/docker/v/leplusorg/qrcode?sort=semver)](https://hub.docker.com/r/leplusorg/qrcode)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/10071/badge)](https://bestpractices.coreinfrastructure.org/projects/10071)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/leplusorg/docker-qrcode/badge)](https://securityscorecards.dev/viewer/?uri=github.com/leplusorg/docker-qrcode)

## Example without using the filesystem

Let's say that you have a file `foo.txt` in your current working directory that you want to convert into a QR code image `foo.png`:

**Mac/Linux**

```bash
cat foo.txt | docker run --rm -i --net=none leplusorg/qrcode qrencode -o - > foo.png
```

**Windows**

```batch
type foo.txt | docker run --rm -i --net=none leplusorg/qrcode qrencode -o - > foo.png
```

## Example using the filesystem

Same thing, assuming that you have a file `foo.txt` in your current working directory that you want to convert into a QR code image `foo.png`:

**Mac/Linux**

```bash
docker run --rm -t --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/tmp" leplusorg/qrcode qrencode -r /tmp/foo.txt -o /tmp/foo.png
```

**Windows**

In `cmd`:

```batch
docker run --rm -t --net=none -v "%cd%:/tmp" leplusorg/qrcode qrencode -r /tmp/foo.txt -o /tmp/foo.png
```

In PowerShell:

```pwsh
docker run --rm -t --net=none -v "${PWD}:/tmp" leplusorg/qrcode qrencode -r /tmp/foo.txt -o /tmp/foo.png
```

## Help

To know more command-line options of `qrencode`:

```bash
docker run --rm --net=none leplusorg/qrcode qrencode -h
```

## Software Bill of Materials (SBOM)

To get the SBOM for the latest image (in SPDX JSON format), use the
following command:

```bash
docker buildx imagetools inspect leplusorg/qrcode --format '{{ json (index .SBOM "linux/amd64").SPDX }}'
```

Replace `linux/amd64` by the desired platform (`linux/amd64`, `linux/arm64` etc.).

## Provenance

To get the provenance for the latest image (in JSON format), use the
following command:

```bash
docker buildx imagetools inspect leplusorg/qrcode --format '{{ json .Provenance }}'
```

## Sigstore

[Sigstore](https://docs.sigstore.dev) is trying to improve supply
chain security by allowing you to verify the origin of an
artifact. You can verify that the image that you use was actually
produced by this repository. This means that if you verify the
signature of the Docker image, you can trust the integrity of the
whole supply chain from code source, to CI/CD build, to distribution
on Maven Central or wherever you got the image from.

You can use the following command to verify the latest image using its
sigstore signature attestation:

```bash
cosign verify leplusorg/qrcode --certificate-identity-regexp 'https://github\.com/leplusorg/docker-qrcode/\.github/workflows/.+' --certificate-oidc-issuer 'https://token.actions.githubusercontent.com'
```

The output should look something like this:

```text
Verification for index.docker.io/leplusorg/xml:main --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - The code-signing certificate was verified using trusted certificate authority certificates

[{"critical":...
```

For instructions on how to install `cosign`, please read this [documentation](https://docs.sigstore.dev/cosign/system_config/installation/).

## Request new tool

Please use [this link](https://github.com/leplusorg/docker-qrcode/issues/new?assignees=thomasleplus&labels=enhancement&template=feature_request.md&title=%5BFEAT%5D) (GitHub account required) to request that a new tool be added to the image. I am always interested in adding new capabilities to these images.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## Security

Please read [SECURITY.md](SECURITY.md) for details on our security policy and how to report security vulnerabilities.

## Code of Conduct

Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details on our code of conduct.

## License

This project is licensed under the terms of the [LICENSE](LICENSE) file.
