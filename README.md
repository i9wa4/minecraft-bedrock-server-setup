# minecraft-bedrock-server-setup

This Minecraft server automatically updates itself and creates backups of the world to AWS S3.

cf. Docker image: <https://hub.docker.com/r/itzg/minecraft-bedrock-server>

## 1. Requirements

- Linux machine
    - Docker
    - systemd
    - AWS CLI
- AWS S3 bucket

## 2. Set up the server

1. Clone this repository.
    ```sh
    git clone https://github.com/i9wa4/minecraft-bedrock-server-setup ~/mbs/minecraft-bedrock-server-setup
    ```
1. Create `.env` in the root of this repository and set values.
    ```sh
    MY_UID=1000
    MY_GID=1000
    MY_USER_NAME=i9wa4
    PORT_SERVER=
    PORT_SSH=
    SERVER_NAME=minecraft-bedrock-server
    WORLD_NAME=
    DIR_REPO=~/mbs/minecraft-bedrock-server-setup
    DIR_BACKUP=~/mbs/backup
    DIR_SERVER=~/mbs/server
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

## 3. Update the server manually

```sh
systemctl --user start mbs-update.service
```

## 4. View logs

```sh
docker compose logs

# attach: docker compose up
# detach: CTRL-Z
```
