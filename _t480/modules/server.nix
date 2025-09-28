{ pkgs, ... }:

let
  serverSrc = builtins.path {
    path = ../server;
    name = "server";
  };
in
{
  system.activationScripts.copy-server-folder.text = ''
    echo "Copying server folder to /var/lib/server..."

    rm -rf /var/lib/server
    cp -r ${serverSrc} /var/lib/server
  '';

  system.activationScripts.restart-server.text = ''
    echo "Restarting docker-compose-server..."

    /run/current-system/systemd/bin/systemctl restart docker-compose-server.service
  '';

  systemd.services.docker-compose-server = {
    description = "Server Docker Compose Service";
    after = [ "docker.service" ];
    requires = [ "docker.service" ];

    serviceConfig = {
      Type = "simple";

      WorkingDirectory = "/var/lib/server";

      ExecStart = "${pkgs.docker-compose}/bin/docker-compose up";
      ExecStop = "${pkgs.docker-compose}/bin/docker-compose down";

      Restart = "on-failure";
      TimeoutStopSec = "30s";

      KillMode = "control-group";
    };

    wantedBy = [ "multi-user.target" ];
  };
}
