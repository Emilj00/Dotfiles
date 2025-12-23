{ pkgs, utils, ... }:

{
  home.file.".config/hypr".source = utils.mkSymlink /home/config/hypr;
  home.file.".config/rofi".source = utils.mkSymlink /home/config/rofi;
  home.file.".config/waybar".source = utils.mkSymlink /home/config/waybar;

  home.packages = with pkgs; [
    rofi
    
    hyprland
    waybar
    swww
    
    networkmanagerapplet

    swayosd

    pavucontrol

    grim
    hyprshot
  ];
}

