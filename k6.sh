k6 run --insecure-skip-tls-verify /home/k6/single-request.js
echo "Sleeping for 400 seconds"
sleep 400
exit 0