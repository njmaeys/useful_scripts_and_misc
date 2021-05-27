import os
import random
import time
from prometheus_client import start_http_server, Gauge

MY_GAUGE = Gauge('process_check', 'Check status of service', ['host', 'process'])

def failures():
  randone = random.randint(0, 10)
  randtwo = random.randint(0, 20)
  return [
    {
      'process': 'process_one',
      'val': randone,
    },
    {
      'process': 'process_two',
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
    ge = MY_GAUGE
    host = os.uname()[1]

    fails = failures()

    generate_prom_metrics(host, fails, ge)

    time.sleep(15)