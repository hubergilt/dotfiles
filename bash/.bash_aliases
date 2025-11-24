# PostgreSQL aliases
alias pgstart='sudo -u postgres $PGHOME/bin/pg_ctl -D $PGDATA -l $PGDATA/logfile start'
alias pgstop='sudo -u postgres $PGHOME/bin/pg_ctl -D $PGDATA stop'
alias pgstatus='sudo -u postgres $PGHOME/bin/pg_ctl -D $PGDATA status'
alias pgrestart='sudo -u postgres $PGHOME/bin/pg_ctl -D $PGDATA -l $PGDATA/logfile restart'
alias pgsql='sudo -u postgres $PGHOME/bin/psql'
