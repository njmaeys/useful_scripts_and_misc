import random
import time
import logging
import sys
from prometheus_client import (
  start_http_server, 
  Counter,
)


def check_process():
  randone = random.randint(0, 20)
  return randone

def generate_prom_metrics(rand_val, errors, client):
  if rand_val <= 10:
    errors.labels(client, 'failure').inc(rand_val)
  else:
    errors.labels(client, 'success').inc(rand_val)
  return


if __name__ == '__main__':
  my_list = ['foo-0', 'foo-1', 'foo-3']

  process_counter = Counter('my_process', 'Check status of service', ['client', 'status'])

  start_http_server(8000)
  logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)
  count = 0
  while True:
    count += 1
    logging.info(f'Counter {count}')
    for m in my_list:
      rand_val = check_process()
      generate_prom_metrics(rand_val, process_counter, m)

    time.sleep(15)