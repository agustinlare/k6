import http from 'k6/http';
import { sleep, check } from 'k6';
import { Counter } from 'k6/metrics';
// A simple counter for http requests
export const requests = new Counter('http_reqs');
// you can specify stages of your test (ramp up/down patterns) through the options object
// target is the number of VUs you are aiming for
var counts = __ENV.K6_TARGET_COUNTS.toString()
var time = __ENV.K6_TARGET_TIME.toString()
var endpoint = __ENV.K6_TARGET_ENDPOINT.toString()

export const options = {
  stages: [
    { target: counts, duration: time },
  ],
  thresholds: {
    requests: ['count < 100'],
  },
};
export default function () {
  const res = http.post(endpoint,
    JSON.stringify({
        "name": "login_total",
        "value": 1.0,
        "tags": [
            {
                "label": "environment",
                "value": "test"
            },
            {
                "label": "transaction",
                "value": "success"
            }
        ]
    })
  );
  sleep(1);
  const checkRes = check(res, {
    'status is 200': (r) => r.status === 200
  });
}
