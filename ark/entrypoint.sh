#!/bin/sh
### install/update program
steamcmd +login anonymous +app_update 376030 +quit

### start server
argments="\
TheIsland?listen?\
SessionName=gli_test_server?\
ServerPassword=p?\
ServerAdminPassword=admin_password?\
 -server\
 -log\
"
cd /data/ark/ShooterGame/Binaries/Linux
echo "./ShooterGameServer $argments"
exec ./ShooterGameServer "$argments"
echo "\nshut down Ark server\n"
