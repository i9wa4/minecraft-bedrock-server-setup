# minecraft-bedrock-server-setup

This is a DRAFT!

## 1. How to setup the server

1. Clone this repository.
    - `sudo git clone https://github.com/i9wa4/minecraft-bedrock-server-setup /docker/minecraft-bedrock-server-setup`
1. Create `.env` in the root of this repository.

    ```sh
    UID=1000
    GID=1000
    USERNAME=i9wa4
    PORT_SERVER=
    PORT_SSH=
    WORLD_NAME=25nishi
    DIR_REPO=/docker/minecraft-bedrock-server-setup
    ```

1. Initialize the server.

    ```sh
    cd /docker/minecraft-bedrock-server-setup
    bash bin/init.sh
    docker compose up -d --wait
    docker compose stop
    ```

1. Overwrite the followings if needed.
    - /docker/mbs/allowlist.json
    - /docker/mbs/permissions.json
    - /docker/mbs/server.properties
    - /docker/mbs/valid_known_packs.json
    - /docker/mbs/worlds/

1. Start the server.

    ```sh
    docker compose up -d --wait
    ```

## 2. Update the server manually

```sh
bash bin/update.sh
```
