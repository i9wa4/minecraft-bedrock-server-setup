# minecraft-bedrock-server-setup

This is a DRAFT!

## 1. create `.env` for compose.yml

```plaintext
UID=1000
GID=1000
USERNAME=i9wa4
PORT=
PORT_SSH=
```

## 2. Initialize Server

```sh
bash bin/init.sh
docker compose up -d --wait
docker compose stop
bash bin/mycopy.sh
# copy world
docker compose up -d --wait
```

## 3. Update Server

```sh
docker compose down
docker compose up -d --wait
```
