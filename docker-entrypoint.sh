#!/bin/sh

user=$USER
uid=$PUID
gid=$PGID

addgroup --gid "$GID" "$USER"
adduser --disabled-password --gecos "" --home "/github" --ingroup "$USER" --uid "$UID" "$USER"

su - "$USER"

cd /github

while true
do
  n=1
  name="GITHUB_NAME_${n}"
  eval name=\$$name
  url="GITHUB_URL_${n}"
  eval url=\$$url
  while [ ! -z ${name} ]
  do
    echo $name - $url
    git -C $name pull || git clone $url $name
    n=$((n+1))
    name="GITHUB_NAME_${n}"
    eval name=\$$name
    url="GITHUB_URL_${n}"
    eval url=\$$url
  done
  sleep $SLEEP_TIME
done

