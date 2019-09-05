#!/bin/sh

cd /github

while true; do git -C $GITHUB_NAME_1 pull || git clone $GITHUB_URL_1 $GITHUB_NAME_1; sleep $SLEEP_TIME ; done

