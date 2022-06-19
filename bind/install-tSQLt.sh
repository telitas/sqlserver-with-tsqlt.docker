#!/usr/bin/env bash
# This file is released under the CC0 1.0 Universal (CC0 1.0) Public Domain Dedication.
# See the LICENSE.txt file or https://creativecommons.org/publicdomain/zero/1.0/ for details.

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i /bundle/tSQLt/PrepareServer.sql,/bundle/tSQLt/tSQLt.class.sql
