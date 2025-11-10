{ pkgs, secrets, ... }:

let
  authKey = if secrets.TAILSCALE_KEY == "" then throw "authkey cannot be empty" else secrets.TAILSCALE_KEY;
in
{
  services.tailscale.enable = true;

  systemd.services.tailscale-up = {
    description = "Run tailscale up with auth key";

    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.tailscale}/bin/tailscale up --auth-key=${authKey}";
      Restart = "on-failure";

      User = "root";
    };
  };
}
