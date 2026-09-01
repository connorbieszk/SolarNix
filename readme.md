Device List:

solarsatellite - WSL2 Setup
solarnebula - OPi6+ Router
solarbang - Cisco Router (Need to make a Nix -> Cisco Flake)
solareclpise - Macbook Pro 2015 with NixOS installed
solarpulsar - Main Laptop (Thinkpad X1 Carbon Gen 7)
solarstar - NAS/Virt Server
solarcomet - Small Server ( Windows 7 Era Thinkcentre )
solarmeteor - Small Server ( Windows 7 Era Thinkcentre )

solarsatellite - must specify flake in build

sudo nix --extra-experimental-features "nix-command flakes" \
  run 'github:nix-community/disko/latest#disko-install' -- \
  --flake .#<host> \
  --disk main /dev/disk/by-id/<disk-id>
