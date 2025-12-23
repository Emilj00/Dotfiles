{ pkgs, utils, ... }:

let
  alacrittyThemes = pkgs.fetchgit {
    url = "https://github.com/alacritty/alacritty-theme.git";
    rev = "59a96ef4c734f97a1aadaa619b31cc1ca90a0fbc";
    sha256 = "17f331fsh8lg97jgp0m0b8mrg9vgfyp742yvpd2zvzccr3hm3d6l";
  };
in
{
  programs.alacritty.enable = true;

  home.file.".config/alacritty/alacritty.toml".source = utils.mkSymlink "/home/config/alacritty/alacritty.toml";
  home.file.".config/alacritty/themes".source = alacrittyThemes;
}
