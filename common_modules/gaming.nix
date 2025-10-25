{ pkgs, ... }:

let
  prismThemes = pkgs.fetchFromGitHub {
    owner = "PrismLauncher";
    repo = "Themes";
    rev = "8832f3dd80362524b87fe111fc7a9472bda1b040";
    sha256 = "ZEghbpTleEuoFMlI28EBH3ZEeI3SJxRvqKDyeZvghvA=";
  };
in
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

  system.activationScripts.install-prism-themes.text = ''
    for userDir in /home/*; do
      if [ -d "$userDir" ]; then
        themesDir="$userDir/.local/share/PrismLauncher/themes"

        rm -rf "$themesDir"
        mkdir -p "$themesDir"

        if [ -d "${prismThemes}/themes" ]; then
          cp -r "${prismThemes}/themes/." "$themesDir"

          uid=$(id -u "$(basename "$userDir")")
          gid=$(id -g "$(basename "$userDir")")
          chown -R "$uid:$gid" "$themesDir"
        fi
      fi
    done
  '';
}
