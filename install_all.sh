#!/bin/bash

# Provera da li je root
if [[ $EUID -ne 0 ]]; then
  echo "Pokreni skriptu kao root (sudo)." >&2
  exit 1
fi

# Lokacija repozitorijuma
REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "[+] Kopiram konfiguracije..."
cp -r "$REPO_DIR/etc/"* /etc/
cp -r "$REPO_DIR/usr/"* /usr/
cp -r "$REPO_DIR/var/"* /var/

echo "[+] Kreiram runtime foldere ako ne postoje....."

mkdir -p /tmp/.oscam
touch /var/run/oscam.pid
touch /tmp/warnings.txt 
chmod 755 /tmp/warnings.txt
mkdir -p /var/keys
touch /var/keys/SoftCam.Key
touch /var/keys/AutoRoll.Key
touch /var/keys/constant.cw
mkdir -p /usr/local/etc
mkdir -p /usr/local/etc/cw
mkdir -p /usr/local/etc/emm
touch /usr/local/etc/SoftCam.Key
touch /usr/local/etc/constant.cw
touch /usr/local/etc/AutoRoll.Key


chown root:root /tmp/.oscam /var/run/oscam.pid  /usr/local/etc/ /var/keys/ 
chmod 755 /tmp/.oscam /var/run/oscam.pid /usr/local/etc/ /var/keys/ 


echo "[+] Dozvole binarnih fajlova..."
chmod +x /usr/bin/oscam 2>/dev/null
chmod +x /usr/bin/multics-x64 2>/dev/null
chmod +x /usr/bin/cccam-x64 2>/dev/null

chmod +x /var/etc/cccam/*  2>/dev/null
chmod +x /var/etc/multics/*  2>/dev/null
chmod +x /usr/local/etc/* 2>/dev/null
chmod +x /etc/systemd/system/* 2>/dev/null

# Funkcija za proveru i instalaciju zavisnosti
check_and_install_deps() {
  echo "[*] Proveravam zavisnosti za $1..."
  MISSING_LIBS=$(ldd "$1" | grep "not found" | awk '{print $1}')
 
  if [[ -z "$MISSING_LIBS" ]]; then
    echo "[OK] Sve biblioteke su prisutne za $1"
  else
    echo "[!] Nedostaju biblioteke:"
    echo "$MISSING_LIBS"
    echo "[*] Pokušavam instalirati..."

    for lib in $MISSING_LIBS; do
      case "$lib" in
        libssl.so.1.1|libcrypto.so.1.1)
          apt install -y libssl1.1 libssl-dev ;;
        libssl.so.3|libcrypto.so.3)
          apt install -y libssl3 ;;
        libstdc++.so.6)
          apt install -y libstdc++6 ;;
        libcurl.so.4)
          apt install -y libcurl4 ;;
        *)
          echo "[!] Nepoznata biblioteka: $lib — instaliraj ručno ako treba." ;;
      esac
    done
  fi
}

check_and_install_deps /usr/bin/oscam
check_and_install_deps /usr/bin/multics-x64
check_and_install_deps /usr/bin/cccam-x64

echo ""
echo "-------------------------------------------------------"
echo ">> Instalacija završena!"
echo ">> Otvorite u browseru:"
echo "   - http://$(hostname -I | awk '{print $1}'):8888  (OSCAM Web root/root)"
echo "   - http://$(hostname -I | awk '{print $1}'):5500  (Multics Web )"
echo "   - http://$(hostname -I | awk '{print $1}'):16001  (Multics Web)"
echo "-------------------------------------------------------"
echo "[+] Završeno!"
