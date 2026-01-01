{ pkgs, utils, lib, ... }:

let
  alacrittyThemes = pkgs.fetchgit {
    url = "https://github.com/alacritty/alacritty-theme.git";
    rev = "59a96ef4c734f97a1aadaa619b31cc1ca90a0fbc";
    sha256 = "17f331fsh8lg97jgp0m0b8mrg9vgfyp742yvpd2zvzccr3hm3d6l";
  };

  rpathLibs = with pkgs; [
    expat
    fontconfig
    freetype
    libGL
    libxkbcommon
    wayland
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
  ];

  alacrittySmooth = pkgs.rustPlatform.buildRustPackage rec {
    pname = "alacritty-smooth-cursor";
    version = "0.1.0";
    cargoHash = "sha256-IF40bFW/CmcZueo1jT+xKvZX2dAnO3wI1Ooucar0SYs=";
    

    src = pkgs.fetchFromGitHub {
      owner = "GregTheMadMonk";
      repo = "alacritty-smooth-cursor";
      rev = "3b42705d5aba8e24c5795ebc69387351c92159c9";
      sha256 = "sha256-8GpMBmTyXwNJCjzB1KZrQsgf4y2fUaExQX57OOyRMeE=";
    };


    buildInputs = rpathLibs;

    nativeBuildInputs = [
      pkgs.cmake
      pkgs.pkg-config
      pkgs.makeWrapper
      pkgs.python3
    ];

    dontPatchELF = true;


    postInstall = ''
      patchelf --add-rpath "${lib.makeLibraryPath rpathLibs}" $out/bin/alacritty
      
      install -D extra/linux/Alacritty.desktop -t $out/share/applications/
      install -D extra/logo/compat/alacritty-term.svg $out/share/icons/hicolor/scalable/apps/Alacritty.svg
    '';
  };
in
{
  programs.alacritty = {
    enable = true;
    package = alacrittySmooth;
  };

  home.file.".config/alacritty/alacritty.toml".source = utils.mkSymlink "/home/config/alacritty/alacritty.toml";
  home.file.".config/alacritty/themes".source = alacrittyThemes;
}

