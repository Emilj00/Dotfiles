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

  programs.bat.enable = true;
  # programs.bat.settings = {
  #   theme = "gruvbox-dark";
  # };

  programs.lazydocker.enable = true;
  programs.lazydocker.settings = {
    gui.returnImmediately = true;
  };

  # programs.tmux.enable = true;
  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      gruvbox
      sensible
    ];
  };

  home.activation.setup-tpm = ''
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
      ${pkgs.git}/bin/git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    fi
  '';

  home.file = {
    ".zshrc".source = ../config/shell/zshrc;
    ".tmux.conf".source = ../config/shell/tmux.conf;
    ".zsh-aliases".source = ../config/shell/zsh-aliases;
    ".config/fastfetch.jsonc".source = ../config/shell/fastfetch.jsonc;
  };
}
