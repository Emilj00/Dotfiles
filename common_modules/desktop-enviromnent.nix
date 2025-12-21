{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
