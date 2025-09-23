#!/bin/bash
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

echo "Starting server PRESS CTRL-C to exit"

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
/home/valheim/Steam/steamapps/common/Valheim\ dedicated\ server/valheim_server.x86_64 -name "AnhEm9G" -password "serect" \
 -port 2456 -world "AnhEm9G" -public 1 \
 -savedir "/home/valheim/manual-server/saves/Valheim" \
 -saveinterval 1800 -backups 4 -backupshort 7200 -backuplong 43200 \
 -instanceid 1 -logFile "/home/valheim/manual-server/logs/server.logs" \
 -modifier deathPenalty veryeasy -modifier portals casual

export LD_LIBRARY_PATH=$templdpath


