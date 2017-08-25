#!/bin/bash

DEVDIR="web/app/uploads/"
DEVSITE="example.dev"

PRODDIR="web@example.com:/srv/www/example.com/current/web/app/uploads/"
PRODSITE="example.com"

STAGDIR="web@staging.example.com:/srv/www/example.com/current/web/app/uploads/"
STAGSITE="staging.example.com"

FROM=$1
TO=$2

case "$1-$2" in
  dev-prod) DIR="up";  FROMSITE=$DEVSITE;  FROMDIR=$DEVDIR;  TOSITE=$PRODSITE; TODIR=$PRODDIR; ;;
  dev-stage)    DIR="up"   FROMSITE=$DEVSITE;  FROMDIR=$DEVDIR;  TOSITE=$STAGSITE; TODIR=$STAGDIR; ;;
  prod-dev) DIR="down" FROMSITE=$PRODSITE; FROMDIR=$PRODDIR; TOSITE=$DEVSITE;  TODIR=$DEVDIR; ;;
  stage-dev)    DIR="down" FROMSITE=$STAGSITE; FROMDIR=$STAGDIR; TOSITE=$DEVSITE;  TODIR=$DEVDIR; ;;
  *) echo "usage: $0 dev prod | dev stage | prod dev | prod stage" && exit 1 ;;
esac

read -r -p "Reset the $TO database and sync $DIR from $FROM? [y/N] " response
read -r -p "Sync the uploads folder? [y/N] " uploads

cd ../ &&
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  wp "@$TO" db export $TO-backup.sql &&
  wp "@$TO" db reset --yes &&
  wp "@$FROM" db export $FROM-backup.sql &&
  if $(wp "@$FROM" core is-installed --network); then
    wp "@$FROM" search-replace --url=$FROMSITE $FROMSITE $TOSITE --skip-columns=guid --network --export | wp "@$TO" db import -   
  else
    wp "@$FROM" search-replace --url=$FROMSITE $FROMSITE $TOSITE --skip-columns=guid --export | wp "@$TO" db import - 
  fi
fi
if [[ "$uploads" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  rsync -az --progress "$FROMDIR" "$TODIR"
fi
