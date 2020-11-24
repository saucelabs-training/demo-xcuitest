#!/bin/bash

if [ -z "XCUITEST_API_KEY" ]
then
  echo "XCUITEST_API_KEY environment variable not set, exiting."
  exit -1
fi

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <example number>"
  echo "  Example: $0 1"
  exit -1
fi

EXAMPLE_NUM=$1

java -jar runner.jar config --path runner-ex${EXAMPLE_NUM}.yml --apikey ${XCUITEST_API_KEY}
