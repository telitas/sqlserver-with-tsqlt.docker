# sqlserver-with-tsqlt.docker

A docker container for testing SQL Server.

## Description

[tSQLt](https://tsqlt.org/) is installed in [SQL Server container](https://hub.docker.com/_/microsoft-mssql-server).

## Usage

First, build image

```sh
docker build . --tag sqlserver-with-tsqlt:latest \
    --build-arg sqlserver_tag=latest \
    --build-arg tsqlt_version=latest
```

```sh
export SQLSERVER_TAG=latest
export TSQLT_VERSION=latest

docker compose build
```

and run.

```sh
docker run --publish 1433:1433 --env ACCEPT_EULA=Y --env 'SA_PASSWORD=yourStrong(!)Password' --detach sqlserver-with-tsqlt
```

```sh
docker compose up -d
```

Next, connect to container via `docker exec` the following command or run `/bind/install-tSQLt.sh` script only once.

```sh
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i /bundle/tSQLt/PrepareServer.sql,/bundle/tSQLt/tSQLt.class.sql
```

```sh
docker compose exec db bash -c /bind/install-tSQLt.sh
```

## License

CC0 1.0 Universal (CC0 1.0) Public Domain Dedication

See the LICENSE.txt file or https://creativecommons.org/publicdomain/zero/1.0/ for details.
