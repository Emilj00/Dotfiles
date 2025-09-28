{
  nixpkgs.config.allowUnfree = true;

  home.username = "emilj00";
  home.homeDirectory = "/home/emilj00";

  home.stateVersion = "25.05";

  imports = [ ./modules ];
}
