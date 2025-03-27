# OSCam & MultiCS & CCcam Full Installer + Conf_All

Automatski installer za OSCam i MultiCS sa kompletnom konfiguracijom i servisima. 
Ova skripta omogućava brzo postavljanje OSCam i MultiCS servera na bilo koji Debian/Ubuntu sistem.

---

## Sadržaj

- `etc/` — Systemd servisi za automatsko pokretanje OSCam i MultiCS
- `usr/` — Binarni fajlovi (oscam, multics-x64) i lokalne konfiguracije
- `var/` — Konfiguracione datoteke za MultiCS i OSCam
- `install_all.sh` — Bash skripta koja sve instalira i proverava zavisnosti

---

## Instalacija

1. Kloniraj repozitorijum daj permisije i instaliraj:
   ```bash
   git clone https://github.com/adis992/oscam-cccam-multics-conf_public.git
   cd oscam-cccam-multics-conf_public
   chmod 777 *
   sudo ./install_all.sh
   

2. Nakon instalacije, web pristup:

OSCam Web UI: http://IP:8888

MultiCS Web UI: http://IP:5500

(CCcam Web UI: http://IP:1600)



---

Zahtjevi

Debian/Ubuntu sistem

Root pristup

Internet konekcija (za instalaciju zavisnosti ako fale)

Skripta automatski provjerava i instalira sve potrebne biblioteke (libssl, libcurl, libstdc++ itd.)

Skripta automatski prebacuje binary fajlove i pokrece kao i servise (Multics - Oscam su pocetna s tim da CCcam nije ukljucen u pokretanje ali je spremljen binary i conf, procitaj dodatno conf i fajlove da razumijes)

---

Napomena

Ovaj projekat je namenjen za edukaciju, testiranje i lokalnu upotrebu.
Korišćenje u komercijalne ili nelegalne svrhe je isključivo na odgovornost korisnika.

---

Autor

Adis992
GitHub: github.com/adis992
