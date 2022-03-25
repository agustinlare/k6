FROM ubuntu:latest

ENV WORKDIR="/k6"
ENV K6_TARGET_ENDPOINT="https://dummy.qa.clave.cloud/health"
ENV K6_TARGET_COUNTS=1000
ENV K6_TARGET_TIME="1m"

RUN apt-get update
RUN apt-get install gnupg wget -y
RUN mkdir ${WORKDIR}

RUN wget https://github.com/grafana/k6/releases/download/v0.37.0/k6-v0.37.0-linux-arm64.tar.gz
RUN tar -xzf k6-v0.37.0-linux-arm64.tar.gz -C ${WORKDIR}
RUN mv ${WORKDIR}/k6-v0.37.0-linux-arm64/k6 /usr/local/bin

USER 0
RUN chmod +x /usr/local/bin/k6

WORKDIR ${WORKDIR}

COPY single-request.js .
COPY k6.sh .
RUN chmod +x k6.sh

USER 12345

ENTRYPOINT [ "/bin/sh", "-c", "/k6/k6.sh" ]