{ pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
    fzf
    zoxide

    micro
    cloc

    fd
    ripgrep

    fastfetch
  ];

  programs.btop.enable = true;
  programs.btop.settings = {
    color_theme = "gruvbox_material_dark";
    update_ms = 100;
  };

  programs.lazydocker.enable = true;
  # programs.lazydocker.settings = {

  # };

  # programs.tmux.enable = true;
  # home.activation.setup-tpm = ''
  #   if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  #     ${pkgs.git}/bin/git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  #   fi
  # '';

  home.file = {
    ".zshrc".source = ../config/shell/zshrc;
    ".tmux.conf".source = ../config/shell/tmux.conf;
    ".zsh-aliases".source = ../config/shell/zsh-aliases;
    ".config/fastfetch.jsonc".source = ../config/shell/fastfetch.jsonc;
  };
}
