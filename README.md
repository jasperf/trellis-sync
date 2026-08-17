# Trellis Sync

> ## ⚠️ Superseded by [wp-ops](https://github.com/imagewize/wp-ops)
>
> These scripts still work, but this repo has not been updated since 2018 and is no
> longer maintained. Everything it does is now built into
> **[wp-ops](https://github.com/imagewize/wp-ops)** — a maintained CLI for
> WordPress and Trellis operations:
>
> ```bash
> brew install imagewize/tap/wp-ops
>
> wp-ops db-pull    example.com production   # database, with URL search-replace
> wp-ops files-pull example.com production   # uploads folder, via rsync
> ```
>
> No editing hardcoded domains into a shell script, and no copying files into your
> WordPress root — sites are read from your `wordpress_sites.yml`. Alongside the
> sync commands it covers backups, log monitoring, security scanning, image
> conversion and SEO audits, and ships an MCP server so the same commands are
> callable from an AI coding agent.
>
> The original scripts are still here, and documented below, for reference.

---

This is a repository for the Trellis Database and Uploads Folder Synchronisation scripts and WP CLI Aliases. Two scripts have been added here. The database backup script or `sync-db-from-prod.sh` to synch the production database with the one on the local server and `sync-all.sh` to synchronize both the database and uploads folder.

## File location and changes

Make sure you change the domain in both the shell script and your wp-cli.yaml files. For using the `sync-db-from-prod.sh` script it should be placed in the Wordpress root. For using the `sync-all.sh` it is setup to be run from `site/scripts/`. Or at least it is setup from a subdirectory inside your WordPress root or site folder.

## Database Sync (Production -> Dev)
The Database sync script `sync-db-from-prod.sh` and aliases setup has been created by **Raquelle**. See [Roots Blog post](https://roots.io/leveraging-wp-cli-aliases-in-your-wordpress-development-workflow/). It is set up to sync the database from production and update the one on development or on the local server.

## Sync All

The Sync All script `sync-all.sh` which can be used to synchronize the uploads folder and database has been created by **Ben Word** and thread post where he added can be found at [Roots Discourse]( https://discourse.roots.io/t/leveraging-wp-cli-aliases-in-your-wordpress-development-workflow/8414/12) . It will work for synching to and from production to local and to and from staging to local. It is located in the scripts folder, but will work from any sub directory in your WordPress root which often tends to be site witha standard Trellis setup with Bedrock.

## Installation

Installation can be done using `composer require trellis-sync/trellis-sync`. This is still not fully tested so do make a backup first!
