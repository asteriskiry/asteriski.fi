# Asteriski.fi
Docker WordPress kehitysympäristö Asteriski ry:n tarpeisiin. Repo sisältää docker-compose-filen ja kehitettävät tai muuten relevantit wp-pluginit ja teemat. Itse kehittämämme pluginit ovat repossa git-submoduuleina, niitä ovat mm.
- [wp-arkisto](https://github.com/asteriskiry/wp-arkisto)
- [wp-asteriski-admin-theme](https://github.com/asteriskiry/wp-asteriski-admin-theme)
- [wp-asteriski-auto-email](https://github.com/asteriskiry/wp-asteriski-auto-email)

Teeman kehitys aloitetaan kohta.

### Ohjeet
Docker ja docker-compose tulisi olla asennettuna
```
git clone https://github.com/asteriskiry/asteriski.fi
cd asteriski.fi
docker-compose up -d
```
docker-compose -komento tosiaan roottina (sudo) tai lisää käyttäjäsi docker-ryhmään tai vastaavaan (vaihtelua käyttöjärjestelmästäsi riippuen). Jos tämä ei ole mahdollista, konsultoi [ilmojärjestelmän README.md:tä](https://github.com/asteriskiry/ilmot).

Tämän jälkeen kehitysympäristösi pitäisi löytyä osoitteesta <http://localhost>. Ensimmäisenä pitäisi avautua WP:n asennussivu. Valitse kieli (Suomi) ja tee käyttäjäasetukset miten haluat. Kun asennus on valmis voit käydä aktivoimassa kehityksellesi olennaiset pluginit kohdasta "Lisäosat" (live-sivustolla(asteriski.fi) on käytössä kaikki tässä repossa olevat plugarit). Sitten vielä kun käy aktivoimassa saman teeman kun live-sivustolla (travelify-child) kohdasta "Ulkoasu" niin voi aloittaa kehityksen.

Asiathan näyttävät hiukan erillaiselta kun live-sivustolla, mutta pitäisi riittää. Asioita voi lisäillä omaan ympäristöönsä tarpeen mukaan. 

Ideana että kaikki kehitys tapahtuisi plugineina tai teemoina omissa repoissaan, jotka ovat tässä repossa git-submoduuleina ja muuhun ei koskettaisi.

### Apua
- <https://docs.docker.com/>
- <https://developer.wordpress.org/reference/>
- <https://codex.wordpress.org/Main_Page>
