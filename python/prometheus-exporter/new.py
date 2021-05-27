import os
import random
import time
from prometheus_client import start_http_server, Gauge

SNOW_GAUGE = Gauge('onspring_to_service_now_py', 'Check status of service', ['host', 'process'])

def failures():
  randone = random.randint(0, 10)
  randtwo = random.randint(0, 20)
  return [
    {
      'process': 'failed_new_cases',
      'val': randone,
    },
    {
      'process': 'failed_existing_cases',
      'val': randtwo,
    },
  ]

def generate_prom_metrics(host, failures, ge):
  for f in failures:
    ge.labels(host, f['process']).set(f['val'])
  return


if __name__ == '__main__':
  start_http_server(8000)
  while True:
    ge = SNOW_GAUGE
    host = os.uname()[1]

    fails = failures()

    generate_prom_metrics(host, fails, ge)

    time.sleep(15)