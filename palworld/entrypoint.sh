#!/bin/sh
### install/update program
echo Updating app...
steamcmd  +quit +force_install_dir /palworld/data +login anonymous +app_update 2394010

### start server

cd /palworld/data
echo "Starting PalServer..."
bash ./PalServer.sh
echo "\nshut down PalServer\n"
