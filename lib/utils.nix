{ config, ...}:

{
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Dotfiles/${toString path}";
}
