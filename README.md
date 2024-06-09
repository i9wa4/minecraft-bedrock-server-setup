# minecraft-bedrock-server-setup

This Minecraft server automatically creates backups of the world to Google Drive and updates itself.

## 1. Requirements

- AWS CLI

## 2. Set up the server

1. Clone this repository.
    ```sh
    git clone https://github.com/i9wa4/minecraft-bedrock-server-setup ~/Minecraft/minecraft-bedrock-server-setup
    ```
1. Fix `${THIS_USERNAME}` in `./etc/*.service`.
1. Create `.env` in the root of this repository.

    ```sh
    MY_UID=1000
    MY_GID=1000
    MY_USERNAME=
    PORT_SERVER=
    PORT_SSH=
    WORLD_NAME=
    DIR_REPO=
    DIR_BACKUP=
    DIR_SERVER=
    S3_BUCKET=
    ```

1. Initialize the server.

    ```sh
    sudo bash bin/init.sh
    bash bin/chmod.sh
    docker compose up -d --wait
    docker compose stop
    ```

1. Overwrite the followings if needed.
    - `~/Minecraft/mbs/allowlist.json`
    - `~/Minecraft/mbs/permissions.json`
    - `~/Minecraft/mbs/server.properties`
    - `~/Minecraft/mbs/valid_known_packs.json`
    - `~/Minecraft/mbs/worlds/`

1. Start the server.

    ```sh
    docker compose up -d --wait
    ```

1. Configure systemd.

    ```sh
    sudo bash bin/init-systemd.sh
    ```

## 3. Update the server manually

```sh
sudo bin/update.sh
```

## 4. View logs

```sh
docker compose logs
```

```sh
docker compose up
# detach: CTRL-4
```
