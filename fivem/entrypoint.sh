#!/bin/sh
### install/update program
./artifact.sh ./data

### start server
cd ./data
./run.sh $*
