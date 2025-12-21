{
  services.openssh.enable = true;
  services.openssh = {
    permitRootLogin = "yes";
    passwordAuthentication = true;
  };
}
