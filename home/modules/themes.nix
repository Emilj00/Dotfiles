{ pkgs, ... }:

let
  gtkTheme =
    pkgs.runCommand "unpack-gtk-theme"
      {
        buildInputs = [ pkgs.unzip ];
        src = ../zips/theme.zip;
      }
      ''
        mkdir -p $out
        unzip -q $src -d $out
        chmod -R 755 $out

        for gtkver in 3.0 4.0; do
          echo "[Settings]"                       >> $out/gtk-$gtkver/settings.ini
          echo "gtk-icon-theme-name=Papirus-Dark" >> $out/gtk-$gtkver/settings.ini
        done
      '';

  iconTheme =
    pkgs.runCommand "unpack-icons-theme"
      {
        buildInputs = [ pkgs.unzip ];
        src = ../zips/icons.zip;
      }
      ''
        mkdir -p $out
        unzip -q $src "*/Papirus/*" "*/Papirus-Dark/*" -d temp

        mv temp/*/Papirus $out/
        mv temp/*/Papirus-Dark $out/

        chmod -R 755 $out
      '';
in
{
  home.file.".icons/Papirus".source = "${iconTheme}/Papirus";
  home.file.".icons/Papirus-Dark".source = "${iconTheme}/Papirus-Dark";

  home.file.".themes/Theme".source = gtkTheme;

  home.file.".config/cinnamon".source = "${gtkTheme}/cinnamon";
  home.file.".config/gnome-shell".source = "${gtkTheme}/gnome-shell";
  home.file.".config/gtk-2.0".source = "${gtkTheme}/gtk-2.0";
  home.file.".config/gtk-3.0".source = "${gtkTheme}/gtk-3.0";
  home.file.".config/gtk-4.0".source = "${gtkTheme}/gtk-4.0";
  home.file.".config/index.theme".source = "${gtkTheme}/index.theme";
  home.file.".config/metacity-1".source = "${gtkTheme}/metacity-1";
  home.file.".config/plank".source = "${gtkTheme}/plank";
  home.file.".config/xfwm4".source = "${gtkTheme}/xfwm4";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;

    size = 24;
  };

  dconf.settings."org/gnome/desktop/interface" = {
    icon-theme = "Papirus-Dark";
  };

  home.activation.setup-flatpak-theme = ''
    ${pkgs.flatpak}/bin/flatpak override --user --filesystem=$HOME/.themes
    ${pkgs.flatpak}/bin/flatpak override --user --filesystem=$HOME/.icons

    ${pkgs.flatpak}/bin/flatpak override --user --filesystem=xdg-config/gtk-4.0
    ${pkgs.flatpak}/bin/flatpak override --user --env=ICON_THEME=Papirus-Dark 
  '';
}
