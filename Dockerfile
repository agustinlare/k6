FROM loadimpact/k6
COPY single-request.js .
COPY k6.sh /home/k6/

USER 0
RUN chmod +x k6.sh

USER 12345

ENTRYPOINT [ "/bin/sh", "-c", "/home/k6/k6.sh" ]