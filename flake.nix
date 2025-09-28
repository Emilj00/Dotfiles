{
  description = "NixOS configurations for multiple hosts (T480, Gigabyte, etc.)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-flatpak,
      ...
    }:
    let
      system = "x86_64-linux";

      commonModules = ./common_modules;
      secrets = import ./secrets.nix;

      sharedHomeConfig = name: {
        _module.args.hostname = name;
        imports = [ ./home/home-config.nix ];
      };

      # Helper to define host configs
      makeHost =
        name:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./_${name}/hardware-configuration.nix
            ./_${name}/modules

            commonModules

            nix-flatpak.nixosModules.nix-flatpak
            home-manager.nixosModules.home-manager

            {
              networking.hostName = name;

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.emilj00 = sharedHomeConfig name;
              home-manager.backupFileExtension = "backup";

              _module.args.secrets = secrets;
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        t480 = makeHost "t480";
        gigabyte = makeHost "gigabyte";
      };
    };
}
