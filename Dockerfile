FROM alpine:3.7

WORKDIR /workdir
ENV FIRMWARE=/workdir/raspberry-firmware

# Install build dependencies
RUN apk add --no-cache bash git

COPY build-tarball.sh /
CMD ["/build-tarball.sh"]
