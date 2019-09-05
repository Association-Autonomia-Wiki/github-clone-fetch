#!/bin/sh

user=$USER
uid=$PUID
gid=$PGID
actualuser=$(getent passwd "$uid" | cut -d: -f1)
actualgroup=$(id -g -n "$actualuser")
echo $actualuser - $actualgroup
deluser --remove-home $actualuser
delgroup $actualgroup
addgroup --gid "$GID" "$USER"
adduser --disabled-password --gecos "" --home "/github" --ingroup "$USER" --no-create-home --uid "$UID" "$USER"

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

