{ pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
      intel-media-driver
      libva
    ];
  };
}
