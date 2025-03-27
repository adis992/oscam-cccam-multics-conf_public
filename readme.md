# OSCam & MultiCS & CCcam Full Installer + conf_all

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
   git clone git@github.com:adis992/oscam-cccam-multics-conf_public.git
   cd oscam-cccam-multics-conf_public
   chmod +x install_all.sh
   sudo ./install_all.sh
   

2. Nakon instalacije, web pristup:

OSCam Web UI: http://IP:8888

MultiCS Web UI: http://IP:5500

CCcam Web UI: http://IP:1600



---

Zahtjevi

Debian/Ubuntu sistem

root pristup

Internet konekcija (za instalaciju zavisnosti ako fale)

Skripta automatski provjerava i instalira sve potrebne biblioteke (libssl, libcurl, libstdc++ itd.).

---

Napomena

Ovaj projekat je namenjen za edukaciju, testiranje i lokalnu upotrebu.
Korišćenje u komercijalne ili nelegalne svrhe je isključivo na odgovornost korisnika.

---

Autor

Adis992
GitHub: github.com/adis992
