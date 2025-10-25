let
  default-apps-file-text = ''
    [Default Applications]
    text/html=org.mozilla.firefox.desktop
    x-scheme-handler/http=org.mozilla.firefox.desktop
    x-scheme-handler/https=org.mozilla.firefox.desktop
    x-scheme-handler/about=org.mozilla.firefox.desktop
    x-scheme-handler/unknown=org.mozilla.firefox.desktop
    application/zip=org.gnome.Nautilus.desktop
    image/jpeg=org.gnome.Loupe.desktop
    image/png=org.gnome.Loupe.desktop
    video/mp4=io.github.celluloid_player.Celluloid.desktop

    [Added Associations]
    application/zip=org.gnome.Nautilus.desktop;
    video/mp4=io.github.celluloid_player.Celluloid.desktop;

    [Removed Associations]
    application/zip=org.prismlauncher.PrismLauncher.desktop;
  '';
in
{
  home.activation.default-apps = ''
    rm -rf .config/mimeapps.list
    echo "${default-apps-file-text}" >> .config/mimeapps.list
  '';
}
