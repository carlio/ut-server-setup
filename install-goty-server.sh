#!/bin/bash
mkdir /opt/utgoty/
cd /opt/utgoty/

apt-get install unrar-free libsm-dev libxi6

wget https://launchpad.net/ubuntu/+source/glib1.2/1.2.10-19build1/+build/462715/+files/libglib1.2ldbl_1.2.10-19build1_i386.deb
wget https://launchpad.net/ubuntu/+source/gtk+1.2/1.2.10-18.1build2/+build/484191/+files/libgtk1.2_1.2.10-18.1build2_i386.deb
wget https://launchpad.net/ubuntu/+source/gtk+1.2/1.2.10-18.1build2/+build/484191/+files/libgtk1.2-common_1.2.10-18.1build2_all.deb

dpkg -i libglib1.2ldbl_1.2.10-19build1_i386.deb
dpkg -i libgtk1.2-common_1.2.10-18.1build2_all.deb
dpkg -i libgtk1.2_1.2.10-18.1build2_i386.deb
ldconfig

wget -O UT-GOTY-CD1.iso http://www.utrealms.com/request.php?64
wget -O UT-GOTY-CD2.iso http://www.utrealms.com/request.php?65

mkdir m1 m2
mount -o loop UT-GOTY-CD1.iso m1
mount -o loop UT-GOTY-CD2.iso m2

wget https://liflg.reto-schneider.ch/files/final/unreal.tournament_436-multilanguage.run
wget https://liflg.reto-schneider.ch/files/final/unreal.tournament.official.bonus.pack.collection.run

chmod +x unreal.tournament_436-multilanguage.run
chmod +x unreal.tournament.official.bonus.pack.collection.run

mkdir server
./unreal.tournament_436-multilanguage.run
./unreal.tournament.official.bonus.pack.collection.run

cd server/System
for i in ../Maps/*.uz ; do ./ucc-bin decompress $i -nohomedir ; done
mv *.unr ../Maps

