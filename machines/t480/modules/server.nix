{
  pkgs,
  lib,
  ...
}: let
  serversSrc = ../servers;

  dir = builtins.readDir serversSrc;

  servers = builtins.attrNames (
    lib.filterAttrs
    (
      name: type:
        type
        == "directory"
        && builtins.pathExists (../servers + "/${name}/docker-compose.yml")
    )
    dir
  );

  mkServer = name: {
    name = "Docker-Compose-${name}";
    value = {
      description = "Docker Server - ${name}";
      after = ["docker.service"];
      requires = ["docker.service"];

      serviceConfig = {
        Type = "simple";

        WorkingDirectory = "/var/lib/servers/${name}";

        ExecStart = "${pkgs.docker-compose}/bin/docker-compose up";
        ExecStop = "${pkgs.docker-compose}/bin/docker-compose down";

        Restart = "on-failure";

        TimeoutStopSec = "30s";
        KillMode = "control-group";
      };

      wantedBy = ["multi-user.target"];
    };
  };
in {
  system.activationScripts.copy-servers.text = ''
    echo "Coping servers to /var/lib/servers..."

    mkdir -p /var/lib/servers
    cp -rf ${serversSrc}/* /var/lib/servers/
    chmod -R +w /var/lib/servers/
  '';

  system.activationScripts.restart-servers.text = ''
    SYSTEMCTL="${pkgs.systemd}/bin/systemctl"
    
    echo "Restarting Docker servers..."
    for server_dir in /var/lib/servers/*; do
      if [ -d "$server_dir" ]; then
        name=$(basename "$server_dir")
        server_name="Docker-Compose-$name.service"
      
        if $SYSTEMCTL list-unit-files "$server_name" >/dev/null 2>&1; then
          echo " - Restarting $server_name..."
          $SYSTEMCTL restart "$server_name"
        fi
      fi
    done
  '';

  systemd.services = builtins.listToAttrs (map mkServer servers);
}
