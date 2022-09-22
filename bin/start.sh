#!/bin/ash

bin/rails db:migrate && \
  bin/rails s
