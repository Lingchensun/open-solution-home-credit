FROM ubuntu:16.04

RUN \
  apt-get update && \
  apt-get install -y python3 python3-dev python3-pip python3-virtualenv && \
  rm -rf /va/lib/apt/lists/*

RUN pip3 install neptune-cli steppy-toolkit steppy==0.1.4 attrdict==2.0.0 category_encoders==1.2.6 click==6.7 lightgbm==2.1.1 numpy==1.14.3 pandas==0.23.1 scikit_learn==0.19.1 PyYAML==3.12 xgboost==0.72.1

WORKDIR /app
ADD . /app

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

CMD python3 main.py -- train_evaluate_predict_cv --pipeline_name lightGBM
