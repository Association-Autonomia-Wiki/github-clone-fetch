#!/bin/sh

user=$USER
uid=$PUID
gid=$PGID
actualuser=$(getent passwd "$uid" | cut -d: -f1)
actualgroup=$(id -g -n "$actualuser")
echo $actualuser - $actualgroup
deluser --remove-home $actualuser
delgroup $actualgroup
addgroup --gid "$gid" "$user"
adduser --disabled-password --gecos "" --home "/github" --ingroup "$user" --no-create-home --uid "$uid" "$user"
chown $user:$user /github
chown $user:$user /github-loop.sh
chmod +x /github-loop.sh

echo user ready

su-exec "$PUID" /github-loop.sh
