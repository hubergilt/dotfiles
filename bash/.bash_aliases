# PostgreSQL aliases
alias pgstart='sudo -u postgres $PGHOME/bin/pg_ctl -D $PGDATA -l $PGDATA/logfile start'
alias pgstop='sudo -u postgres $PGHOME/bin/pg_ctl -D $PGDATA stop'
alias pgstatus='sudo -u postgres $PGHOME/bin/pg_ctl -D $PGDATA status'
alias pgrestart='sudo -u postgres $PGHOME/bin/pg_ctl -D $PGDATA -l $PGDATA/logfile restart'
alias pgsql='sudo -u postgres $PGHOME/bin/psql'
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
