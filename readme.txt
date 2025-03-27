-U ETC follderu su 2 servisa, koja sluze za pokretanje oscam servisa i multics-x64
-U USR folderu imamo bin i local folder u bin su binary oscam i mcs za 32/64bitni linux pc, a u local imamo etc i u njemu oscam full conf
-U VAR folderu imamo etc folder i u njemu cccam  i multics folder a u njima konfiguracija za cccam odvojena i za multics-odvojena


-Ako zelimo dodati i cccam binary npr treba dodati u /usr/bin/cccam i permisije
-Treba isto napraviti /etc/systemd/system/cccam.service
-Konfiguracioni fajlovi su vec kreirani samo treba unijeti sadrzaj u /var/etc/cccam/* 
-Tu je vec kreiran CCcam.cfg a sto treba popuniti je .providers .prio .channelinfo i IpToCountry.csv oni su vec uneseni u multics.cfg tj ukljuceni sa include ali su komentirani jer su prazni!


-U binary imamo vec cccam-x64 spremljen za uporabu ali nije ukljucen u sve ovo

-U MULTICS.CFG SAM DODAO PROFILES I NAVEO SVAKI PORT IZ PROFILA ZA POZIV S JEDNOG MJESTA AIMA I U MGCAMD.CFG ISTO MGPROFILES: I ISKKLJUCENI SU OBA
