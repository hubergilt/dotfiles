# PostgreSQL aliases
#pgstart() {
#    local PGUSER="${1:-postgres}"
#    local _pwd; _pwd="$(pwd)"
#    cd /tmp || return 1
#    sudo -u "$PGUSER" $PGHOME/bin/pg_ctl -D $PGDATA -o "-c config_file=$PGCONFDIR/postgresql.conf" -l $PGDATA/logfile start
#    cd "$_pwd" || return 1
#}
#
#pgstop() {
#    local PGUSER="${1:-postgres}"
#    local _pwd; _pwd="$(pwd)"
#    cd /tmp || return 1
#    sudo -u "$PGUSER" $PGHOME/bin/pg_ctl -D $PGDATA stop
#    cd "$_pwd" || return 1
#}
#
#pgstatus() {
#    local PGUSER="${1:-postgres}"
#    local _pwd; _pwd="$(pwd)"
#    cd /tmp || return 1
#    sudo -u "$PGUSER" $PGHOME/bin/pg_ctl -D $PGDATA status
#    cd "$_pwd" || return 1
#}
#
#pgrestart() {
#    local PGUSER="${1:-postgres}"
#    local _pwd; _pwd="$(pwd)"
#    cd /tmp || return 1
#    sudo -u "$PGUSER" $PGHOME/bin/pg_ctl -D $PGDATA -o "-c config_file=$PGCONFDIR/postgresql.conf" -l $PGDATA/logfile restart
#    cd "$_pwd" || return 1
#}
#
#pgsql() {
#    local PGUSER="${1:-postgres}"
#    local _pwd; _pwd="$(pwd)"
#    cd /tmp || return 1
#    sudo -u "$PGUSER" $PGHOME/bin/psql
#    cd "$_pwd" || return 1
#}
#
##mysql aliases
#mysql-connect() {
#    local USER="${1:-root}"
#    mysql -u "$USER" -p --socket="$MYSQL_SOCKET"
#}
#
#mysql-start() {
#    local ver; ver="$(basename "$MYSQL_HOME")"
#    sudo systemctl start "mysql-${ver}"
#}
#
#mysql-stop() {
#    local ver; ver="$(basename "$MYSQL_HOME")"
#    sudo systemctl stop "mysql-${ver}"
#}
#
#mysql-restart() {
#    local ver; ver="$(basename "$MYSQL_HOME")"
#    sudo systemctl restart "mysql-${ver}"
#}
#
#mysql-status() {
#    local ver; ver="$(basename "$MYSQL_HOME")"
#    sudo systemctl status "mysql-${ver}"
#}
#
#mysql-enable() {
#    local ver; ver="$(basename "$MYSQL_HOME")"
#    sudo systemctl enable "mysql-${ver}"
#}
#
#mysql-disable() {
#    local ver; ver="$(basename "$MYSQL_HOME")"
#    sudo systemctl disable "mysql-${ver}"
#}
#
#mysql-logs() {
#    local ver; ver="$(basename "$MYSQL_HOME")"
#    sudo journalctl -u "mysql-${ver}" -f
#}
#
##mariadb aliases
#mariadb-connect() {
#    local USER="${1:-root}"
#    mariadb -u "$USER" -p --socket="$MARIADB_SOCKET"
#}
#
#mariadb-start() {
#    local ver; ver="$(basename "$MARIADB_HOME")"
#    sudo systemctl start "mariadb-${ver}"
#}
#
#mariadb-stop() {
#    local ver; ver="$(basename "$MARIADB_HOME")"
#    sudo systemctl stop "mariadb-${ver}"
#}
#
#mariadb-restart() {
#    local ver; ver="$(basename "$MARIADB_HOME")"
#    sudo systemctl restart "mariadb-${ver}"
#}
#
#mariadb-status() {
#    local ver; ver="$(basename "$MARIADB_HOME")"
#    sudo systemctl status "mariadb-${ver}"
#}
#
#mariadb-enable() {
#    local ver; ver="$(basename "$MARIADB_HOME")"
#    sudo systemctl enable "mariadb-${ver}"
#}
#
#mariadb-disable() {
#    local ver; ver="$(basename "$MARIADB_HOME")"
#    sudo systemctl disable "mariadb-${ver}"
#}
#
#mariadb-logs() {
#    local ver; ver="$(basename "$MARIADB_HOME")"
#    sudo journalctl -u "mariadb-${ver}" -f
#}
