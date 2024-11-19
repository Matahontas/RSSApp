# Aplikacija za pregledavanje RSS Feedova

Ova aplikacija sastoji se od dva glavna ekrana (Feeds i Favorites) između kojih se navodi pomoću tab trake na dnu zaslona.

## Feeds
Na ovom ekranu prikazani su svi feedovi koje je korisnik dodao u svoju aplikaciju.
Za svaki feed prikazana je slika (ako postoji), naslov i opis. 
U gornjem desnom kutu nalazi se gumb koji otvara ekran za unos URL-a za dodavanje novog feeda.
Nakon dodavanja novog feeda vraća se na početni **Feeds** zaslon.
Klikom na svaki pojedini feed otvara se ekran sa člancima iz tog feeda - **Feed Items**.
Svaki feed dopušta i swipe prema desno i prema lijevo.
Na swipe prema desno - korisniku se prikazuje gumb koji kada se pritisne dodaje taj feed u favorites i on bude prikazan na **Favorites** ekranu. 
Ponovnim pritiskom na taj gumb feed se miče iz favoritesa. 
Na swipe prema lijevo - korisniku se prikazuje gumb koji služi za brisanje feeda iz aplikacije.

### Feed Items
Svaki članak ima svoj naslov, datum objavljivanja i opis.
Klikom na pojedini članak otvara se web preglednik unutar aplikacije koji vodi na cijeli članak.
Povlačenjem ekrana prema dolje članci se osvježavaju i prikazuju najnoviji dostupni.
Također povlačenjem ekrana prema dolje prikazuje se i traka za pretraživanje koja pretražuje naslove i opise svih prikazanih članaka.

## Favorites
**Favorites** ekran ima sve jednake funkcionalnosti kao i **Feeds** osim što nema opciju dodavanja novih i prikazani su samo oni feedovi koji su u 
favoritima. 
