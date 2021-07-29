FROM loadimpact/k6
COPY single-request.js .
COPY k6.sh /home/k6/

ENV K6_TARGET_ENDPOINT=""

USER 0
RUN chmod +x k6.sh

USER 12345

# ENTRYPOINT [ "/bin/sh", "-c", "/home/k6/k6.sh" ]
ENTRYPOINT [ "/bin/sh", "-c", "sleep 3600" ]