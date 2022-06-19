# This file is released under the CC0 1.0 Universal (CC0 1.0) Public Domain Dedication.
# See the LICENSE.txt file or https://creativecommons.org/publicdomain/zero/1.0/ for details.

ARG sqlserver_tag=latest
ARG tsqlt_version=latest
FROM mcr.microsoft.com/mssql/server:${sqlserver_tag}
ARG tsqlt_version

LABEL dev.telitas.project.repository="https://github.com/telitas/sqlserver-with-tsqlt.docker"
LABEL dev.telitas.base.repository="https://hub.docker.com/_/microsoft-mssql-server"

USER root

RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl "https://tsqlt.org/download/tsqlt/$(if [[ "${tsqlt_version}" = "latest" ]];then echo ""; else echo "?version=${tsqlt_version}"; fi)" --output /tmp/tSQLt.zip && \
    (unzip /tmp/tSQLt.zip -d /tmp/tSQLt/ || :) && \
    mkdir -p /bundle/tSQLt/ && \
    mv /tmp/tSQLt/License.txt /tmp/tSQLt/PrepareServer.sql /tmp/tSQLt/tSQLt.class.sql /bundle/tSQLt/ && \
    rm -rf /tmp/*

USER mssql
