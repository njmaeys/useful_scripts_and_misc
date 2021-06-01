# Python Prometheus Exporter

Simple example of a prometheus exporter that sends out custom metrics from a python script.
Follow this for setting up prometheus in minikube
- http://blog.marcnuri.com/prometheus-grafana-setup-minikube/

```
- job_name: 'custom-python'
  static_configs:
    - targets: ['py-collector-service.monitoring.svc.cluster.local:8000']
```
Example of the scrape configuration in the prometheus ConfigMap