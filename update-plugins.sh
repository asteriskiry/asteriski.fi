#!/usr/bin/env bash
# Script to update our self-developed dependencies

echo "
 █████╗ ███████╗████████╗███████╗██████╗ ██╗███████╗██╗  ██╗██╗
██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗██║██╔════╝██║ ██╔╝██║
███████║███████╗   ██║   █████╗  ██████╔╝██║███████╗█████╔╝ ██║
██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗██║╚════██║██╔═██╗ ██║
██║  ██║███████║   ██║   ███████╗██║  ██║██║███████║██║  ██╗██║
╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚═╝
"

REPOROOT=$(pwd)

cd wp-content/plugins/wp-tenttiarkisto || exit 1
git pull
cd "$REPOROOT" || exit 1
cd wp-content/plugins/wp-poytakirjat || exit 1
git pull
cd "$REPOROOT" || exit 1
cd wp-content/plugins/wp-asteriski-admin-theme || exit 1
git pull
cd "$REPOROOT" || exit 1
cd wp-content/plugins/wp-asteriski-auto-email || exit 1
git pull
cd "$REPOROOT" || exit 1
cd wp-content/plugins/wp-asteriski-calendar || exit 1
git pull
cd "$REPOROOT" || exit 1
cd wp-content/themes/wp-asteriski-theme || exit 1
git pull
cd "$REPOROOT" || exit 1
exit 0
