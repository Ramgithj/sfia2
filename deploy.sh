#!/bin/bash

cd /home/ubuntu/sfia2/kubernetes/
kubectl create ns sfia
kubectl apply -f nginx-conf.yaml
kubectl apply -f flask-app-be.yaml
kubectl apply -f cluster-ip-be.yaml
kubectl apply -f flask-app-fe.yaml
kubectl apply -f cluster-ip-flask.yaml
kubectl apply -f nginx.yaml
kubectl apply -f nginx-loadbalancer.yaml
kubectl get pods -n sfia
