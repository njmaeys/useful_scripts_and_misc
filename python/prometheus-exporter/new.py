from prometheus_client import make_wsgi_app, Gauge
from wsgiref.simple_server import make_server
import os, subprocess

# This serivice name will put in grep command
# Example : ps -ef | grep 'myprocess1'
# Kindly Specify process name carefully.

services = ['myprocess1','myprocess2','elasticsearch']

host = os.uname()[1]
g = Gauge('service_health_status', 'Check status of service', ['host','script_name_pattern'])

def generate():
  for s in services:
    try:
      proc1 = subprocess.Popen(['ps', '-ef'], stdout=subprocess.PIPE)
      proc2 = subprocess.Popen(['grep', s], stdin=proc1.stdout,stdout=subprocess.PIPE, stderr=subprocess.PIPE)
      proc3 = subprocess.Popen(['wc', '-l'], stdin=proc2.stdout,stdout=subprocess.PIPE, stderr=subprocess.PIPE)
      proc1.stdout.close() # Allow proc1 to receive a SIGPIPE if proc2 exits.
      proc2.stdout.close() # Allow proc2 to receive a SIGPIPE if proc3 exits.

      out, err = proc3.communicate()

      if err:
        g.labels(host,s).set(0)
      else:
        p=int(out)
        if p > 1:        
          g.labels(host,s).set(1)
        else:        
          g.labels(host,s).set(0)
    except:
      g.labels(host,s).set(0)


metrics_app = make_wsgi_app()

def my_app(environ, start_fn):
  if environ['PATH_INFO'] == '/metrics':
      generate()
      return metrics_app(environ, start_fn)

httpd = make_server('', 8000, my_app)
httpd.serve_forever()