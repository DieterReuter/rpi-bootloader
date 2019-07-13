FROM alpine:3.10

WORKDIR /workdir
ENV FIRMWARE=/workdir/raspberry-firmware \
    FIRMWARE_REPO=https://www.github.com/raspberrypi/firmware \
    TIMESTAMP_OUTPUT=true

# Install build dependencies
RUN apk add --no-cache bash git

COPY build-tarball.sh /
CMD ["/build-tarball.sh"]
