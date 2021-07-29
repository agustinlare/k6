import http from 'k6/http';
import { sleep, check } from 'k6';
import { Counter } from 'k6/metrics';
// A simple counter for http requests
export const requests = new Counter('http_reqs');
// you can specify stages of your test (ramp up/down patterns) through the options object
// target is the number of VUs you are aiming for
export const options = {
  stages: [
    { target: 10000, duration: '1m' },
  ],
  thresholds: {
    requests: ['count < 100'],
  },
};
export default function () {
  const res = http.post({__ENV.K6_TARGET_ENDPOINT},
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
