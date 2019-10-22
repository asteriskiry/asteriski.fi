# Asteriski.fi

Docker WordPress kehitysympäristö Asteriski ry:n sivuston kehittämistä varten. Repo sisältää tarvittavat tiedostot Dockerin ajamiseen. Teemat ja pluginit joita kehitämme tämän repon avulla:

#### Pluginit:
- [wp-tenttiarkisto](https://github.com/asteriskiry/wp-tenttiarkisto)
- [wp-poytakirjat](https://github.com/asteriskiry/wp-poytakirjat)
- [wp-asteriski-admin-theme](https://github.com/asteriskiry/wp-asteriski-admin-theme)
- [wp-asteriski-auto-email](https://github.com/asteriskiry/wp-asteriski-auto-email)
- [wp-asteriski-calendar](https://github.com/asteriskiry/wp-asteriski-calendar)
#### Teema:
- [wp-asteriski-theme](https://github.com/asteriskiry/wp-asteriski-theme)

### Ohjeet
`Docker` ja `docker-compose` tulisi olla asennettuna (<https://docs.docker.com/install/#supported-platforms>).

Aloita komennolla:
```
git clone https://github.com/asteriskiry/asteriski.fi
```
Lataa uusin `asteriskifi-docker-files-XX-XXXX.zip` Google Drivestä ja pura se `asteriski.fi`-kansioon. Kyseisessä zipissä on `wp-content` ja `mysql-dump` -kansiot. Tämän jälkeen `asteriski.fi`-kansion sisältä pitäisi löytyä nämä tiedostot:
```
docker-compose.yml
.git/
.gitignore
LICENSE
mysql-dump/
README.md
update-plugins.sh
wp-content/
```

Kun tiedostot ovat paikallaan voit ajaa repositorion juuresta (`asteriski.fi`-kansiosta) komennon:
```
docker-compose up
```

Tämän jälkeen kehitysympäristösi pitäisi löytyä osoitteesta <http://localhost>. Pitäisi näyttää samalta kuin live-sivusto. Admin-puolelle pääset kirjautumaan osoitteessa <http://localhost/wp-admin>. Voit luoda itsellesi admin-oikedet omaavan tunnuksen esimerkiksi komennolla:
```
docker-compose run --rm cli wp user create admin admin@example.com --role=administrator --user_pass=admin
```

Voit päivittää kaikki itse kehittämämme repot ajan tasalle komennolla:
```
./update-plugins.sh
```

Jos haluat päivittää Google Drivestä saadut tiedostot helpointa on poistaa `wp-content` ja `mysql-dump` -kansiot ja korvata ne uusilla. Tämän jälkeen poista kaikki Docker-tiedostot komennolla (Tämä poistaa kaikkien konttien kaikki tiedostot):
```
docker system prune -a --volumes
```

Ideana olisi että tähän repoon ei tehtäisi muutoksia muuta kuin ylläpidollisista syistä. Kehitys tapahtuisi omissa pluginien/teemojen repoissa. Kun olet esim. repon hakemistossa `asteriski.fi/wp-content/plugins/wp-tenttiarkisto` toimii homma kuten olisit tavallisesti WP-Tenttiarkisto -repossa eli muutokset menevät WP-Tenttiarkisto -repoon, ei tähän.

### Muuta
- phpMyAdmin löytyy osoitteesta <http://localhost:8080>. Tunnukset löytyy `docker-compose.yml`-tiedostosta.
- Jos tarvitsee testailla sähköpostienlähetystoimintoja kannattaa asentaa [wp-mail-catcher](https://wordpress.org/plugins/wp-mail-catcher/)-plugin.
- Tämä on käytännössä täysi kopio live-sivustosta, joten kehitystä varten voi olla järkevä ottaa pois käytöstä tiettyjä optimointiplugineja kuten `autoptimize` ja `nginx-helper`.

### Apua
- <https://docs.docker.com/>
- <https://developer.wordpress.org/reference/>
- <https://codex.wordpress.org/Main_Page>

---
© Asteriski ry
