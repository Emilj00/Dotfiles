{ pkgs, ... }:

let
  authKey = "tskey-auth-kYwXMXPMGo11CNTRL-YV1BmdE9xz8M7ctrLE1cz8uFQmVEMW5pU";
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
