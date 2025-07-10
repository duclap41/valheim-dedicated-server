# This is repo create and run dedicated server Valheim on Ubuntu with Docker
> Note: This guide assumes that Docker and Docker Compose are already installed on your system. If you're unfamiliar with them, please refer to their official documentation or search online for installation instructions.

## 1. [Optional] Copy folder that contain your file world save, then paste to this repo :
* Window: `C:\Users\<UserName>\AppData\LocalLow\IronGate\Valheim\worlds_local`
* Linux: `~/.config/unity3d/IronGate/Valheim/worlds_local`

> (It should exist only 1 world, if not copy all file contain "your_world_name" to new `worlds_local` folder)

## 2. Modify `Dockerfile`:
* At the line after "# valheim entrypoint", edit parameter:
> "-name", "YourServerName" \
> "-world", "YourCurrentWorldName" \
> "-password", "YourPassword"
* For instance, if your the file world save that name "FirstWorld", and you want passworld is "hello123":
> "-name", "UbuntuHost" \
> "-world", "FirstWorld" \
> "-password", "hello123"

## 3. Run docker-compose:
Use terminal and run `docker compose up -d`.
> run `docker compose logs` if want to check logs

## 4. Check server IP:
Run `hostname -I`, result example: 192.168.1.100. Remember this string.

## 5. Join game from your local pc:
Start game, choose join server, fill server ip `192.168.1.100:2456` and your password which you just created.