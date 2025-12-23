{ pkgs, lib, ... }:

let
  serversSrc = toString ../servers;

  dir = builtins.readDir serversSrc;

  servers = builtins.attrNames (
    lib.filterAttrs
      (name: type:
        type == "directory"
        && builtins.pathExists (../servers + "/${name}/docker-compose.yml")
      )
      dir
  );

  mkServer = name: {
    name = "Docker-Compose-${name}";
    value = {
      description = "Docker Server - ${name}";
      after = [ "docker.service" ];
      requires = [ "docker.service" ];

      serviceConfig = {
        Type = "simple";

        WorkingDirectory = "/var/lib/servers/${name}";

        ExecStart = "${pkgs.docker-compose}/bin/docker-compose up";
        ExecStop = "${pkgs.docker-compose}/bin/docker-compose down";

        Restart = "on-failure";

        TimeoutStopSec = "30s";
        KillMode = "control-group";
      };

      wantedBy = [ "multi-user.target" ];
    };
  };
in {
  system.activationScripts.copy-servers.text = ''
    echo "Copying servers..."
    rm -rf /var/lib/servers
    cp -r ${serversSrc} /var/lib/servers
  '';

  systemd.services = builtins.listToAttrs (map mkServer servers);
}

