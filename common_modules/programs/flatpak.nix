{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    flatpak
    gnome-software
  ];

  services.flatpak.enable = true;

  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }
  ];
}
