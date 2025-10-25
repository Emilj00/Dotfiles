{ pkgs, ... }:

{
  programs.vscode.enable = true;

  home.packages = with pkgs; [
    dotnet-sdk_9
    nodejs

    yarn
  ];
}
