# PostgreSQL aliases
pgstart() {
    local PGUSER="${1:-postgres}"
    local _pwd; _pwd="$(pwd)"
    cd /tmp || return 1
    sudo -u "$PGUSER" $PGHOME/bin/pg_ctl -D $PGDATA -o "-c config_file=$PGCONFDIR/postgresql.conf" -l $PGDATA/logfile start
    cd "$_pwd" || return 1
}

pgstop() {
    local PGUSER="${1:-postgres}"
    local _pwd; _pwd="$(pwd)"
    cd /tmp || return 1
    sudo -u "$PGUSER" $PGHOME/bin/pg_ctl -D $PGDATA stop
    cd "$_pwd" || return 1
}

pgstatus() {
    local PGUSER="${1:-postgres}"
    local _pwd; _pwd="$(pwd)"
    cd /tmp || return 1
    sudo -u "$PGUSER" $PGHOME/bin/pg_ctl -D $PGDATA status
    cd "$_pwd" || return 1
}

pgrestart() {
    local PGUSER="${1:-postgres}"
    local _pwd; _pwd="$(pwd)"
    cd /tmp || return 1
    sudo -u "$PGUSER" $PGHOME/bin/pg_ctl -D $PGDATA -o "-c config_file=$PGCONFDIR/postgresql.conf" -l $PGDATA/logfile restart
    cd "$_pwd" || return 1
}

pgsql() {
    local PGUSER="${1:-postgres}"
    local _pwd; _pwd="$(pwd)"
    cd /tmp || return 1
    sudo -u "$PGUSER" $PGHOME/bin/psql
    cd "$_pwd" || return 1
}
#msyql aliases
mysql-connect() {
    local USER="${1:-root}"
    mysql -u "$USER" -p --socket="$MYSQL_SOCKET"
}
#mariadb aliases
mariadb-connect() {
    local USER="${1:-root}"
    mariadb -u "$USER" -p --socket="$MARIADB_SOCKET"
}
