# This is repo create and run dedicated server Valheim on Ubuntu

## 1. Set up environment on Ubuntu:
Install Steam and Packages
``` sh
sudo add-apt-repository multiverse
sudo apt install software-properties-common
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install lib32gcc-s1 steamcmd
sudo apt-get install libpulse-dev libatomic1 libc6
```
Must successfully install all, unless server not run.

## 2. Create new user:
``` sh
sudo adduser valheim
```
Type password then press Enter to skip user information, type 'y' at last.
``` sh
su - valheim
``` 

## 3. Copy 'saves/manual-server/' folder to '/home/valheim/
Should use 'scp -r'

## 4. Run SteamCMD and Install Valheim Server:
``` ssh
steamcmd
```
Wait for steam update
``` steamcmd
login anonymous
app_update 896660 validate
```
Wait for Valheim Server Installing
``` steamcmd
exit
```

## 5. Set Server Parameters:
Copy my example configs to server location:
``` sh
cp saves/ae9g_server.sh /home/valheim/Steam/steamapps/common/Valheim\ dedicated\ server/
```
Use Nano or Vim at ae9g_server.sh to change configs, read 'Valheim Dedicated Server Manual.pdf' in this path to comprehend parameters. (You can change for personal world)

## 6. Run Server with Tmux:
``` sh
tmux new -s vhserver
cd /home/valheim/Steam/steamapps/common/Valheim\ dedicated\ server/
./ae9g_server.sh
```
Press 'Ctrl' + 'B' + 'D' to exit tmux but it don't terminate the server.

Hold a minutes, your server will start. You can read logs at '/home/valheim/manual-server/logs/server.logs'.

Use can attach the session by 'tmux attach -t vhserver' then press 'Ctrl' + 'C' to stop server.

## 7. Join Server from Game client:
Find your server ip address, it will have `ip:2456` format, which 'ip' is your internet public ip (Ex:102.72.96.58:2456).
``` sh
curl https://ifconfig.me
```
It will print your public internet ip.

Choose 'Add Server' after click 'Start' on client game, then paste your server address.

> If your network is not public (open NAT). It depend on your Network Router, type 'how to allow NAT' + your Router Name to find solution.

## 8. Use firewall for security:
``` sh
su - root
ufw enable
ufw allow 22
ufw allow 2456:2458/udp
```
Port 22 is allow you keep using SSH.

2456:2458 is 3 ports which your game runs on.