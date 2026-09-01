{
  description = "Personal Network (solar) NixOS Configurations";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };

    nixos-wsl = { url = "github:nix-community/NixOS-WSL/main"; };
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }:
  let
  # Shared Modules
  sharedModules = [
    ./modules/shared/git.nix
    ./modules/users/pblez.nix
  ];

  # Type Specific Modules
  desktopModules = [
    #./modules/desktop/cups.nix
    #./modules/desktop/sound.nix
  ];

  serverModules = [

  ];

  laptopModules = [
    ./modules/laptop/wifi.nix
  ];

  wslModules = [
  nixos-wsl.nixosModules.default

  {
    wsl.enable = true;
    wsl.defaultUser = "pblez";
  }
  ];

  # Type Module Definitions
  typeModules = {
    desktop = desktopModules;

    laptop = desktopModules ++ laptopModules;

    server = serverModules;

    wsl = serverModules ++ wslModules;
  };

  ## Host Helper
  mkHost =
  {
    hostname,
    system,
    type,
    modules ? [],
  }:

  nixpkgs.lib.nixosSystem {
    inherit system;

    modules =
    [
    {
      networking.hostName = hostname; # Set Hostname here
    }
    ]

    ## Add type specific modules
    ++ (
    if builtins.hasAttr type typeModules
    then typeModules.${type}
    else throw "Unknown host type: ${type}"
    )

    ## Add the shared modules
    ++ sharedModules

    ## Add the host specific modules
    ++ modules;
  };
  in
  {
    nixosConfigurations = {
      solarsatellite = mkHost {
        hostname = "solarsatellite";
        system = "x86_64-linux";
        type = "wsl";
        modules = [
        ./hosts/solarsatellite/default.nix
        ];
      };

      solarpulsar = mkHost {
        hostname = "solarpulsar";
        system = "x86_64-linux";
        type = "laptop";
        modules = [
          ./hosts/solarpulsar/default.nix
        ];
      };
    };
  };
}
