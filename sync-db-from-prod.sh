# sync-db-from-prod.sh
read -r -p "Do you solemnly swear that you have had fewer than 2 alcoholic beverages in the last hour and that you would really like to reset your development database and pull the latest from production? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    wp @development db reset --yes
    wp @production db export - > sql-dump-production.sql
    wp @development db import sql-dump-production.sql
    wp @development search-replace https://imagewize.nl http://imagewizenl.dev --skip-columns=guid
else
    exit 0
fi
