#!/bin/bash
# Script to get all established connection seen from all dockers


docker inspect --format '{{.State.Pid}} {{printf "%.13s" .ID}} {{.Config.Image}}' \
$(docker ps --format '{{.ID}}') | while read dockpid id name;
do
    echo $id $name;
    sudo nsenter -t $dockpid -n netstat -pan | grep ESTABLISHED;
done
