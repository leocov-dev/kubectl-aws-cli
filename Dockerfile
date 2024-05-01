FROM python:3.11-alpine

ARG TARGETPLATFORM

RUN apk add --no-cache curl bash

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/${TARGETPLATFORM}/kubectl
RUN chmod +x kubectl && mv kubectl /usr/local/bin

RUN pip install awscli --upgrade --no-cache-dir

RUN apk del curl
