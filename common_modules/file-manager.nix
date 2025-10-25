{ pkgs, ... }:

{
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    nautilus

    udisks2
    unzip
    unrar
  ];

  services.gvfs.enable = true;
  services.dbus.enable = true;
}
