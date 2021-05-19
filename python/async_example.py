import asyncio
import time


async def do_stuff(key):
  time.sleep(key['wait'])
  return key['key_name']

async def run(data):
  tasks = []
  for d in data:
    tasks.append(do_stuff(d))

  resp = []
  for future in asyncio.as_completed(tasks):
    result = await future
    resp.append(result)

  return resp


if __name__ == '__main__':
  data = [
    {'key_name': 'node-01', 'wait': 2},
    {'key_name': 'node-02', 'wait': 2},
    {'key_name': 'node-03', 'wait': 3},
    {'key_name': 'node-04', 'wait': 5},
    {'key_name': 'node-05', 'wait': 10},
    {'key_name': 'node-06', 'wait': 1},
  ]

  responses = asyncio.run(run(data))
  print(responses)

