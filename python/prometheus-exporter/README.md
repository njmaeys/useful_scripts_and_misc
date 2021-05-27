# Python Prometheus Exporter

Simple example of a prometheus exporter that sends out custom metrics from a python script.

```
- job_name: 'custom-python'
  static_configs:
    - targets: ['py-collector-service.monitoring.svc.cluster.local:8000']
```
Example of the scrape configuration in the prometheus ConfigMap