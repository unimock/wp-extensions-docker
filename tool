#!/bin/bash

_hints()
{
  echo " g7-wp-extensions (wp-cli, mysql-client, wget, curl, nano)"
  echo ""
  echo "  examples:"
  echo ""
  echo "     > mysql -h ${WORDPRESS_DB_HOST%:3306} -u root -p$WORDPRESS_DB_PASSWORD"
  echo "     > mysqldump -h ${WORDPRESS_DB_HOST%:3306} -u root -p$WORDPRESS_DB_PASSWORD wordpress > /exchange/db.sql"
  echo "     > wp core install --url=example.com --title=Example --admin_user=supervisor --admin_password=strongpassword --admin_email=info@example.com"
  echo "     > wp plugin install updraftplus --activate"
  echo "     > wp plugin install smtp-mailer --activate"
  echo "     > wp user list"
  
  echo ""
  echo "  hints:"
  echo ""
  echo "     * only <mysql database>, </var/www/html> and </exchange> will survive an image re-creation!"
  echo ""
  echo "  > tool hints  # display this hints"
  echo "  > exit        # leave console"
  echo "" 
}


if [ "$1" = "" ] ; then
  echo ""
  echo " usage : `basename $0` <command>  ..."
  echo "         commands:"
  echo "           hints ... show hints"
  echo ""
  exit 0
fi

if [ "$1" = "hints" ] ; then
  clear
  _hints
  exit 0
fi

