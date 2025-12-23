{ pkgs, utils, ... }:

{
  programs.vscode.enable = true;

  programs.neovim.enable = true;
  home.file.".config/nvim".source = utils.mkSymlink "/home/config/nvim";

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
