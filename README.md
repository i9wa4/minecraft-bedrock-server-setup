# minecraft-bedrock-server-setup

This Minecraft server automatically creates backups of the world to Google Drive and updates itself.

## 1. Requirements

- AWS CLI

## 2. Set up the server

1. Clone this repository.
    ```sh
    sudo git clone https://github.com/i9wa4/minecraft-bedrock-server-setup /docker/minecraft-bedrock-server-setup
    ```
1. Fix `User` and `Group` in `./etc/*.service`.
1. Create `.env` in the root of this repository.

    ```sh
    MY_UID=1000
    MY_GID=1000
    PORT_SERVER=
    PORT_SSH=
    WORLD_NAME=
    DIR_REPO=
    DIR_BACKUP=
    ```

1. Initialize the server.

    ```sh
    sudo bash bin/init.sh
    docker compose up -d --wait
    docker compose stop
    ```

1. Overwrite the followings if needed. You may need `sudo chown root:root`.
    - `/docker/mbs/allowlist.json`
    - `/docker/mbs/permissions.json`
    - `/docker/mbs/server.properties`
    - `/docker/mbs/valid_known_packs.json`
    - `/docker/mbs/worlds/`

1. Start the server.

    ```sh
    docker compose up -d --wait
    ```

1. Grant execution permission to scripts.

    ```sh
    sudo bash bin/chmod.sh
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
