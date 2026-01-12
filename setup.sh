#!/bin/bash
set -e
CWD="$(dirname "${0}")"
# Create prefix directory
mkdir /tek-x86_64
# Copy msystem and makepkg-mingw configuration
cp "${CWD}/TEK-X86_64" /etc/msystem.d/
cp "${CWD}/tek-x86_64.conf" /etc/makepkg_mingw.d/
# Add TEK to the case that sets environment variables for MinGW systems
sed -i 's/MINGW\*|CLANG\*|UCRT\*/MINGW\*|CLANG\*|UCRT\*|TEK\*/' /etc/profile
# Add binary package repository to pacman
echo -e '\n[tek-x86_64]\nServer = https://teknology-hub.com/software/mingw/tek-x86_64/' >> /etc/pacman.conf
# Download Nuclearist's GPG key and add it to pacman's keyring
curl --fail -o "${CWD}/nuclearist.asc" https://teknology-hub.com/public-keys/gpg/nuclearist.asc
pacman-key -a "${CWD}/nuclearist.asc"
rm "${CWD}/nuclearist.asc"
pacman-key --lsign-key nuclearist@teknology-hub.com
# Create a shell launcher by copying it from clang64 and adjusting the ini file
cp /clang64.exe /tek-x86_64.exe
cp /clang64.ini /tek-x86_64.ini
sed -i 's/CLANG64/TEK-X86_64/' /tek-x86_64.ini
