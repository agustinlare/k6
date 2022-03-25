k6 run --insecure-skip-tls-verify ./single-request.js
echo "Sleeping for 400 seconds"
sleep 400
exit 0