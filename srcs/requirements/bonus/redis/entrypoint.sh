#!/bin/bash

service redis-server start
kill $(ps | grep redis-server | awk '{print $1}')
redis-server
