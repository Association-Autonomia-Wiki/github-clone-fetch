#!/bin/sh

echo user $USER changed

cd /github

while true
do
  n=1
  name="GITHUB_NAME_${n}"
  eval name=\$$name
  url="GITHUB_URL_${n}"
  eval url=\$$url
  branch="GITHUB_BRANCH_${n}"
  eval branch=\$$branch
  while [ ! -z ${name} ]
  do
    echo $name - $url
    if [ -z ${branch} ]
    then
      git -v -C $name pull || git clone -v $url $name
    else
      git -v -C $name pull || git clone -v -b $branch $url $name
    fi
    n=$((n+1))
    name="GITHUB_NAME_${n}"
    eval name=\$$name
    url="GITHUB_URL_${n}"
    eval url=\$$url
    branch="GITHUB_BRANCH_${n}"
    eval branch=\$$branch
  done
  sleep $SLEEP_TIME
done
