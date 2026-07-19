# PostgreSQL aliases
alias pgstart='cd /tmp && sudo -u postgres $PGHOME/bin/pg_ctl -D $PGDATA -o "-c config_file=$PGCONFDIR/postgresql.conf" -l $PGDATA/logfile start && cd $HOME'
alias pgstop='cd /tmp && sudo -u postgres $PGHOME/bin/pg_ctl -D $PGDATA stop && cd $HOME'
alias pgstatus='cd /tmp && sudo -u postgres $PGHOME/bin/pg_ctl -D $PGDATA status && cd $HOME'
alias pgrestart='cd /tmp && sudo -u postgres $PGHOME/bin/pg_ctl -D $PGDATA -o "-c config_file=$PGCONFDIR/postgresql.conf" -l $PGDATA/logfile restart && cd $HOME'
alias pgsql='cd /tmp && sudo -u postgres $PGHOME/bin/psql && cd $HOME'
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
