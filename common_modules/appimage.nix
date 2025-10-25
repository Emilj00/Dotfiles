{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    appimage-run
    fuse
    fuse2fs
  ];

  programs.fuse.userAllowOther = true;
}
