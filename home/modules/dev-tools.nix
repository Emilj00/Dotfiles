{ pkgs, ... }:

{
  programs.vscode.enable = true;

  programs.neovim.enable = true;
  home.file.".config/nvim".source = ../config/nvim;
  home.file.".config/nvim".recursive = true;

  home.packages = with pkgs; [
    dotnet-sdk_9
    nodejs

    yarn

    cargo

    gcc
    cmake
    gnumake
  ];
}
