#bin/sh
set -e
cp -r   tempmysql/* /var/lib/mysql/  &&  mysqld 