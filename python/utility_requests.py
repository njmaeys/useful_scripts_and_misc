import requests
import json
from datetime import datetime


def log_message(message, log_level):
  return f'{datetime.now()} {log_level} - {message}'

def build_headers(onspring_token=None):
  # This can be extended upon to build up more headers.
  # It can be modified here or another function to build up just generic json objects
  # that can be fed to a request.

  headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  }

  if onspring_token:
    headers['X-APIKey'] = onspring_token

  return headers

def build_request(base_url, api_endpoint, headers, params=None, data=None, method='GET', auth=None):
  err = None

  r = requests.request(
    url='{base_url}{api_endpoint}'.format(
      base_url=base_url,
      api_endpoint=api_endpoint),
    headers=headers,
    params=params,
    data=json.dumps(data),
    method=method,
    auth=auth
  )

  if r.status_code < 200 or r.status_code > 299:
    err = "Bad request: {response}\n".format(
      response=json.loads(r.content))
  
  return err, r