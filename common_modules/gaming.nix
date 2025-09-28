{ pkgs, ... }:

{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    heroic
    prismlauncher
    lutris

    wineWowPackages.stable
    umu-launcher
    winetricks

    dxvk
    vkd3d

    adwsteamgtk
  ];
}
