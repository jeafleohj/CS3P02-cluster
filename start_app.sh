#!/bin/bash
echo 'Creating deployment...'
vagrant ssh master -c  "kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4"
echo 'Setting replicas to 2...'
vagrant ssh master -c "kubectl scale deployment hello-node --replicas=2"
echo 'Setting up service to expose deployment...'
vagrant ssh master -c "kubectl expose deployment hello-node --type=LoadBalancer --port=8080"
