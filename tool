#!/bin/bash

_hints()
{
  echo ""
  echo " wp-extensions:"
  echo ""
  echo "  * wp ...... wordpress cli"
  echo "  * mysql ... database operations:"
  echo "              mysql -h ${WORDPRESS_DB_HOST%:3306} -u root -p$WORDPRESS_DB_PASSWORD"
  echo "  * nano .... editor"
  echo "  * wget,curl .... tbd"
  echo "  * exit .... logout"
  echo ""
  echo ""
  echo "  ! only <mysql database> and </var/www/html> and /are persistent for recreate containers !"
  echo "  Umgang mit mc"
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

