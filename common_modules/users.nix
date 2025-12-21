{
  pkgs,
  secrets,
  ...
}: let
  password = secrets.USERS_PASSWORD;
  finalPassword =
    if password == ""
    then throw "password cannot be empty"
    else password;
in {
  programs.zsh.enable = true;

  # Users
  users.users = {
    root = {
      password = finalPassword;
    };

    emilj00 = {
      isNormalUser = true;

      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
        "storage"
        "docker"
        "video"
        "input"
      ];

      password = finalPassword;
    };
  };
}
