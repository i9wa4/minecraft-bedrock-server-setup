# minecraft-bedrock-server-setup

This Minecraft server automatically updates itself and creates backups of the world and config to AWS S3.

## 1. Dependencies

- Minecraft bedrock server image
    - <https://hub.docker.com/r/itzg/minecraft-bedrock-server>
    - <https://github.com/itzg/docker-minecraft-bedrock-server>
- Minecraft bedrock world backup system image
    - <https://hub.docker.com/r/kaiede/minecraft-bedrock-backup>
    - <https://github.com/Kaiede/Bedrockifier>

## 2. Requirements

- Linux machine
    - Docker
    - systemd
    - AWS CLI
- AWS S3

## 3. Configuration

- Set `OnCalendar` values in the followings if needed.
    - `etc/mbs-backup-to-cloud.timer`
    - `etc/mbs-backup-to-local.timer`
    - `etc/mbs-update.timer`

## 4. Set up the server

1. Clone this repository.
    ```sh
    git clone https://github.com/i9wa4/minecraft-bedrock-server-setup ~/mbs/minecraft-bedrock-server-setup
    ```
1. Create `.env` in the root of this repository and set values.
    ```sh
    MY_UID=1000
    MY_GID=1000
    MY_USER_NAME=i9wa4
    MY_TZ='Asia/Tokyo'
    PORT_SERVER=
    PORT_SSH=
    SERVER_NAME=mbs
    WORLD_NAME=
    DIR_ROOT=~/mbs
    DIR_REPO=${DIR_ROOT}/minecraft-bedrock-server-setup
    DIR_BACKUP=${DIR_ROOT}/backup
    DIR_BACKUP_CORE=${DIR_BACKUP}/core
    DIR_BACKUP_WORLDS=${DIR_BACKUP}/worlds
    DIR_SERVER=${DIR_ROOT}/server
    AWS_PROFILE=
    S3_BACKUP_URI=
    ```
1. Initialize the server.
    ```sh
    bash bin/init.sh
    docker compose up -d --wait
    ```
1. If you already have a Minecraft world data, follow these steps.
    1. Stop the server.
        ```sh
        docker compose stop
        ```
    1. Overwrite the followings.
        ```plaintext
        ~/mbs/server/allowlist.json
        ~/mbs/server/permissions.json
        ~/mbs/server/server.properties
        ~/mbs/server/valid_known_packs.json
        ~/mbs/server/worlds/
        ```
    1. Start the server.
        ```sh
        docker compose up -d --wait
        ```

## 5. Update the server manually

```sh
systemctl --user start mbs-update.service
```
