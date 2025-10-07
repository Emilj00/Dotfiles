{ config, lib, ... }:

{
  # Run everything on dgpu
  environment.variables = {
    AQ_DRM_DEVICES = "/dev/dri/card0";
  };

  specialisation.intel-gpu.configuration = {
    environment.variables = lib.mkForce {
      AQ_DRM_DEVICES = "/dev/dri/card1";
    };
  };

  # Enable Nvidia drivers
  boot.blacklistedKernelModules = [ "nouveau" ];
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    open = true;

    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };
}
