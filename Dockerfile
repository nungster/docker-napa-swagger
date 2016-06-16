FROM ruby:2.3-alpine

MAINTAINER Nung Bedell <nung.bedell@vtcsecure.com>

RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN mkdir /app

COPY files/apn_voip /app/apn_voip
COPY scripts/run.sh /run.sh

RUN gem install houston
WORKDIR /app/apn_voip



CMD "/run.sh"
