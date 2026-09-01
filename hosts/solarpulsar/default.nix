{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      ./disks.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  system.stateVersion = "26.05";

}

