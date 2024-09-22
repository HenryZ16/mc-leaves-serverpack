export MCDR_ROOT="/home/mc/mcdrserver"
export SERVER_ROOT="${MCDR_ROOT}/server"
export MNT_ROOT="/home/geekpie/mc/mnt/mcdrserver"

mkdir -p ${MNT_ROOT}/config
touch ${MNT_ROOT}/config.yml
touch ${MNT_ROOT}/permission.yml
mkdir -p ${MNT_ROOT}/server
touch ${MNT_ROOT}/server/banned-ips.json
touch ${MNT_ROOT}/server/banned-players.json
touch ${MNT_ROOT}/server/bukkit.yml
touch ${MNT_ROOT}/server/commands.yml
mkdir -p ${MNT_ROOT}/server/config
touch ${MNT_ROOT}/server/help.yml
touch ${MNT_ROOT}/server/leaves.yml
mkdir -p ${MNT_ROOT}/server/logs
touch ${MNT_ROOT}/server/ops.json
touch ${MNT_ROOT}/server/permissions.yml
mkdir -p ${MNT_ROOT}/server/plugins
touch ${MNT_ROOT}/server/spigot.yml
touch ${MNT_ROOT}/server/usercache.json
touch ${MNT_ROOT}/server/whitelist.json
mkdir -p ${MNT_ROOT}/server/world
mkdir -p ${MNT_ROOT}/server/world_nether
mkdir -p ${MNT_ROOT}/server/world_the_end


sudo docker run \
    --name shtechcraft-c4 \
    -p 30001:25565 \
    -v ${MNT_ROOT}/config:${MCDR_ROOT}/config \
    -v ${MNT_ROOT}/config.yml:${MCDR_ROOT}/config.yml \
    -v ${MNT_ROOT}/server/banned-ips.json:${SERVER_ROOT}/banned-ips.json \
    -v ${MNT_ROOT}/server/banned-players.json:${SERVER_ROOT}/banned-players.json \
    -v ${MNT_ROOT}/server/bukkit.yml:${SERVER_ROOT}/bukkit.yml \
    -v ${MNT_ROOT}/server/commands.yml:${SERVER_ROOT}/commands.yml \
    -v ${MNT_ROOT}/server/config:${SERVER_ROOT}/config \
    -v ${MNT_ROOT}/server/help.yml:${SERVER_ROOT}/help.yml \
    -v ${MNT_ROOT}/server/leaves.yml:${SERVER_ROOT}/leaves.yml \
    -v ${MNT_ROOT}/server/logs:${SERVER_ROOT}/logs \
    -v ${MNT_ROOT}/server/ops.json:${SERVER_ROOT}/ops.json \
    -v ${MNT_ROOT}/server/permissions.yml:${SERVER_ROOT}/permissions.yml \
    -v ${MNT_ROOT}/server/plugins:${SERVER_ROOT}/plugins \
    -v ${MNT_ROOT}/server/spigot.yml:${SERVER_ROOT}/spigot.yml \
    -v ${MNT_ROOT}/server/usercache.json:${SERVER_ROOT}/usercache.json \
    -v ${MNT_ROOT}/server/whitelist.json:${SERVER_ROOT}/whitelist.json \
    -v ${MNT_ROOT}/server/world:${SERVER_ROOT}/world \
    -v ${MNT_ROOT}/server/world_nether:${SERVER_ROOT}/world_nether \
    -v ${MNT_ROOT}/server/world_the_end:${SERVER_ROOT}/world_the_end \
    -it \
    shtechcraft:v4.0.4 \
    /bin/bash

    