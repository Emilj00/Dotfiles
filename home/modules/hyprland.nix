{ pkgs, hostname, ... }:

let
  hyprDir = ../config/hypr;
in
{
  home.file.".config/hypr/autostart.conf".source = "${hyprDir}/autostart-${hostname}.conf";
  home.file.".config/hypr/hyprland.conf".source = "${hyprDir}/hyprland.conf";
  home.file.".config/hypr/keybinds.conf".source = "${hyprDir}/keybinds.conf";
  home.file.".config/hypr/launchers.conf".source = "${hyprDir}/launchers.conf";
  home.file.".config/hypr/monitors.conf".source = "${hyprDir}/monitors.conf";
  home.file.".config/hypr/workspaces.conf".source = "${hyprDir}/workspaces-${hostname}.conf";
  home.file.".config/hypr/hardware.conf".source = "${hyprDir}/hardware-${hostname}.conf";

  home.file.".config/rofi".source = ../config/rofi;
  home.file.".config/rofi".recursive = true;

  home.file.".config/waybar".source = ../config/waybar;

  home.packages = with pkgs; [
    rofi-wayland
    hyprland
    waybar
    swww
  ];
}
