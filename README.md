# Trellis Sync
Trellis Database and Uploads Folder Synchronisation script and WP CLI Aliases. Two script have been added here. The database backup script or sync-rpod.sh will work with wp-cli.yaml file with proper domain changes right out of the box and so will the sync all script. Just make sure you change the domain in both the shell script and your wp-cli.yaml files in the Wordpress root.
##Database Sync
The Database sync script `sync-db-from-prod.sh` and aliases setup has been created by Raquelle. See Roots Blog post here https://roots.io/leveraging-wp-cli-aliases-in-your-wordpress-development-workflow/ It is set up to sync the database from production and update the one on development or on the local server.
##Sync All
Sync All script which can be used to synchronize the uploads folder and database has been created by Ben Word and thread post where he added can be found here https://discourse.roots.io/t/leveraging-wp-cli-aliases-in-your-wordpress-development-workflow/8414/12?u=jasperfrumau
