{ config, lib, ...}:

{
  nixpkgs.config.allowUnfree = true;

  home.username = "emilj00";
  home.homeDirectory = "/home/emilj00";

  home.stateVersion = "25.05";

  _module.args.utils = import ../lib/utils.nix { inherit config lib; };
  imports = [ ./modules ];
}
