#!/usr/bin/env bash
# Script to get our self-developed dependencies

echo -e "\\e[1;34m
[0;1;35;95m┳━[0;1;31;91m┓┓[0;1;33;93m━┓[0;1;32;92m┏┓[0;1;36;96m┓┳[0;1;34;94m━┓[0;1;35;95m┳━[0;1;31;91m┓o[0;1;33;93m┓━[0;1;32;92m┓┳[0;1;36;96m┏[0m [0;1;34;94mo[0m
[0;1;31;91m┃━[0;1;33;93m┫┗[0;1;32;92m━┓[0m [0;1;36;96m┃[0m [0;1;34;94m┣[0;1;35;95m━[0m [0;1;31;91m┃┳[0;1;33;93m┛┃[0;1;32;92m┗━[0;1;36;96m┓┣[0;1;34;94m┻┓[0;1;35;95m┃[0m
[0;1;33;93m┛[0m [0;1;32;92m┇━[0;1;36;96m━┛[0m [0;1;34;94m┇[0m [0;1;35;95m┻[0;1;31;91m━┛[0;1;33;93m┇┗[0;1;32;92m┛┇[0;1;36;96m━━[0;1;34;94m┛┇[0m [0;1;35;95m┛[0;1;31;91m┇[0m
\\e[0m"

help() {
    echo "Skripti joka hakee tai päivittää meidän omat repot deviympäristöön"
    echo "Aja ainoastaan asteriski.fi repon juuresta"
    echo "Käyttö:"
    echo "./install.sh --get                    Hae omat gittirepot (kannattaa tehdä vaan ekalla kerralla)"
    echo "./install.sh --update                 Päivitä repot ajan tasalle"
    echo "./install.sh --help                   Tämä aputeksti"
    echo
}

REPOROOT=$(pwd)

if [ "$#" -ne 1 ]; then
    help
    exit 1
else
    case "$1" in
        -h|--help)
            help
            exit 0
            ;;
        --get)
            git clone https://github.com/asteriskiry/wp-tenttiarkisto.git wp-content/plugins/wp-tenttiarkisto
            git clone https://github.com/asteriskiry/wp-poytakirjat.git wp-content/plugins/wp-poytakirjat
            git clone https://github.com/asteriskiry/wp-asteriski-admin-theme.git wp-content/plugins/wp-asteriski-admin-theme
            git clone https://github.com/asteriskiry/wp-asteriski-auto-email.git wp-content/plugins/wp-asteriski-auto-email
            git clone https://github.com/asteriskiry/wp-asteriski-calendar.git wp-content/plugins/wp-asteriski-calendar
            if command -v composer; then
                cd wp-content/plugins/wp-asteriski-calendar
                composer install
                cd "$REPOROOT"
            else
                echo "Composer ei ole asennettuna. WP-asteriski-calendar ei tule toimimaan niinkuin pitää."
            fi
            git clone https://github.com/asteriskiry/wp-asteriski-theme.git wp-content/themes/wp-asteriski-theme
            exit 0
            ;;
        --update)
            cd wp-content/plugins/wp-tenttiarkisto
            git pull
            cd "$REPOROOT"
            cd wp-content/plugins/wp-poytakirjat
            git pull
            cd "$REPOROOT"
            cd wp-content/plugins/wp-asteriski-admin-theme
            git pull
            cd "$REPOROOT"
            cd wp-content/plugins/wp-asteriski-auto-email
            git pull
            cd "$REPOROOT"
            cd wp-content/plugins/wp-asteriski-calendar
            git pull
            if command -v composer; then
                composer install
            else
                echo "Composer ei ole asennettuna. WP-asteriski-calendar ei tule toimimaan niinkuin pitää."
            fi
            cd "$REPOROOT"
            cd wp-content/themes/wp-asteriski-theme
            git pull
            cd "$REPOROOT"
            exit 0
            ;;
        *)
            help
            exit 1
            ;;
    esac
fi

