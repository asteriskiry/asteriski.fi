# Asteriski.fi
Docker WordPress kehitysympäristö Asteriski ry:n tarpeisiin. Repo sisältää docker-compose-filen ja kehitettävät tai muuten relevantit wp-pluginit ja teemat. Itse kehittämämme pluginit ovat repossa git-submoduuleina (jotta voi pitää repoa repon sisällä), niitä ovat mm.
- [wp-arkisto](https://github.com/asteriskiry/wp-arkisto)
- [wp-asteriski-admin-theme](https://github.com/asteriskiry/wp-asteriski-admin-theme)
- [wp-asteriski-auto-email](https://github.com/asteriskiry/wp-asteriski-auto-email)

Teeman kehitys aloitetaan kohta.

### Ohjeet
Docker ja docker-compose tulisi olla asennettuna

Aloita komennolla:
```
git clone --recurse-submodules https://github.com/asteriskiry/asteriski.fi
```
Lataa tietokanta.zip Discord-kanavalta. Pura sisältö (yksi tiedosto: wp-dev-kanta.sql) hakemistoon `asteriski.fi/mysql-dump`. Tämän jälkeen kannan täytyisi löytyä siis polusta `asteriski.fi/mysql-dump/wp-dev-kanta.sql`. Kun kanta on paikoillaan voit jatkaa:
```
cd asteriski.fi
docker-compose up -d
```
Ensimmäisellä kerralla menee hetki. `docker-compose` -komento tosiaan roottina (sudo) tai lisää käyttäjäsi docker-ryhmään tai vastaavaan (vaihtelua käyttöjärjestelmästäsi riippuen). Jos tämä ei ole mahdollista, konsultoi [ilmojärjestelmän README.md:tä](https://github.com/asteriskiry/ilmot).

Tämän jälkeen kehitysympäristösi pitäisi löytyä osoitteesta <http://localhost>. Pitäisi näyttää melko samalta kun live-sivusto. Ainoa mikä puuttuu niin suurin osa kuvista ym. mediasta sillä niitä oli n. 400MB edestä. Admin-puolelle pääset kirjautumaan osoitteessa <http://localhost/wp-admin>. Samat tunnarit mitkä live-sivustolla toimii. Jos ei sellaisia vielä ole, niin voit käyttää tunnusta `admin` salasanalla `admin`. Tämä ei luonnollisestikkaan toimi live-sivustolla.

phpMyAdmin löytyy osoitteesta <http://localhost:8080>. Tunnukset löytyy docker-compose.yml tiedostosta.

wp-cli komentoja pääsee käyttämään esimerkin mukaisesti:
```
docker-compose run --rm cli wp --info
```

Ideana olisi että tähän repoon ei tehtäisi muutoksia muuta kuin ylläpidollisista syistä. Kehitys tapahtuisi omissa pluginien/teemojen repoissa. Kun olet esim. repon hakemistossa `asteriski.fi/wp-content/plugins/wp-arkisto` toimii homma kuten olisit tavallisesti WP-Arkisto -repossa eli muutokset menevät WP-Arkisto -repoon, ei tähän. 

### Apua
- <https://git-scm.com/book/en/v2/Git-Tools-Submodules>
- <https://docs.docker.com/>
- <https://developer.wordpress.org/reference/>
- <https://codex.wordpress.org/Main_Page>
