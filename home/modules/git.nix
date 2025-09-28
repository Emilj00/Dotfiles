{ config, lib, ... }:

let
  ghPath = config.programs.gh.package;
in
{
  programs.gh.enable = true;
  programs.lazygit.enable = true;

  programs.git = {
    enable = true;

    userName = "Emilj00";
    userEmail = "106914054+Emilj00@users.noreply.github.com";

    extraConfig = lib.mkForce ''
      [credential "https://github.com"]
        helper =
        helper = !${ghPath}/bin/gh auth git-credential
      [credential "https://gist.github.com"]
        helper =
        helper = !${ghPath}/bin/gh auth git-credential
    '';
  };
}
