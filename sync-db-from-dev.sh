# sync-db-from-dev.sh
read -r -p "Do you solemnly swear that you have had fewer than 2 alcoholic beverages in the last hour and that you would really like to reset your production database and pull the latest from development? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    wp @production db reset --yes
    wp @development db export - > sql-dump-production.sql
    wp @production db import sql-dump-production.sql
    wp @production search-replace https://imagewize.dev https://imagewize.nl --skip-columns=guid
else
    exit 0
fi
