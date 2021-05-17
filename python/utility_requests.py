import requests
import json
from datetime import datetime


def log_message(message):
  return f'{datetime.now()} - {message}'

def build_headers(onspring_token=None):

  headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  }

  if onspring_token:
    headers['X-APIKey'] = onspring_token

  return headers

def build_params(query_params=None):
  params = {
    'dataFormat': 'Formatted',
  }

  if query_params:
    params['$filter'] = query_params

  return params

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