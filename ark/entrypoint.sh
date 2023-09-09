#!/bin/sh
### install/update program
steamcmd +force_install_dir /ark/data +login anonymous +app_update 376030 +quit

### start server
argments="\
TheIsland?listen?\
SessionName=LapinServer?\
ServerPassword=p?\
ServerAdminPassword=admin_password?\
 -server\
 -log\
"
cd /ark/data/ShooterGame/Binaries/Linux
echo "./ShooterGameServer $argments"
exec ./ShooterGameServer "$argments"
echo "\nshut down Ark server\n"
