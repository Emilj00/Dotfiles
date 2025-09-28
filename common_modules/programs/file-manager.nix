{ pkgs, ... }:

{
  programs.dconf.enable = true;

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "alacritty";
  };

  environment.systemPackages = with pkgs; [
    nautilus

    udisks2
    unzip
    unrar-free
  ];

  services.gvfs.enable = true;
  services.dbus.enable = true;
}
