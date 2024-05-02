# minecraft-bedrock-server-setup

## 1. How to setup the server

1. Clone this repository.
    ```sh
    sudo git clone https://github.com/i9wa4/minecraft-bedrock-server-setup /docker/minecraft-bedrock-server-setup
    ```
1. Fix `User` and `Group` in `etc/*.service`.
1. Create `.env` in the root of this repository.

    ```sh
    MY_UID=1000
    MY_GID=1000
    PORT_SERVER=
    PORT_SSH=
    WORLD_NAME=25nishi
    DIR_REPO=/docker/minecraft-bedrock-server-setup
    DIR_GOOGLE_DRIVE=/home/i9wa4/GoogleDrive
    DIR_BACKUP=/home/i9wa4/Minecraft/mbs-backup
    ```

1. Initialize the server.

    ```sh
    sudo bash bin/init.sh
    docker compose up -d --wait
    docker compose stop
    ```

1. Overwrite the followings if needed. You may need `sudo chown root:root`.
    - /docker/mbs/allowlist.json
    - /docker/mbs/permissions.json
    - /docker/mbs/server.properties
    - /docker/mbs/valid_known_packs.json
    - /docker/mbs/worlds/

1. Start the server.

    ```sh
    docker compose up -d --wait
    ```

1. Configure systemd.

    ```sh
    sudo bash init-systemd.sh
    ```

## 2. Update the server manually

```sh
sudo bin/update.sh
```

## 3. View logs

```sh
docker compose logs
```

```sh
docker compose up
# detach: CTRL-4
```
