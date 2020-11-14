FROM ubuntu:latest

RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils pandoc git
# Cleanup
RUN  apt-get clean && \
  rm -rf /var/lib/apt

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
