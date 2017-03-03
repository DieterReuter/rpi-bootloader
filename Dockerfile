FROM debian:jessie

WORKDIR /workdir
ENV FIRMWARE=/workdir/raspberry-firmware

# Install build dependencies
RUN apt-get update && \
  apt-get install -y git

COPY build-tarball.sh /
CMD ["/build-tarball.sh"]
