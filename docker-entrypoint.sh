#!/bin/sh

cd /github

while true
do
  n=1
  name="GITHUB_NAME_${n}"
  echo $name
  url="GITHUB_URL_${n}"
  echo $url
  while [! -z "$name" ]
  do
    git -C $name pull || git clone $url $name
    ((n++))
  done
  sleep $SLEEP_TIME
done

