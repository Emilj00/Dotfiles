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
  home.file.".config/bat/config".text = ''
    --theme gruvbox-dark
  '';

  programs.lazydocker.enable = true;
  programs.lazydocker.settings = {
    gui.returnImmediately = true;
  };

  home.activation.setup-tpm = ''
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
      ${pkgs.git}/bin/git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    fi
  '';
  programs.tmux = {
    enable = true;

    extraConfig = ''
      # Start window numbering form 1
      set -g base-index 1
      set -g pane-base-index 1
      set-option -g renumber-windows on

      # Add mouse support
      set -g mouse on

      # Change prefix
      set -g prefix M-Space

      # Move with ALT+WASD
      bind-key -n M-a select-pane -L
      bind-key -n M-d select-pane -R
      bind-key -n M-w select-pane -U
      bind-key -n M-s select-pane -D

      # Split with ALT+\ and ALT+-
      bind-key -n M-\\ split-window -h -c "#{pane_current_path}"
      bind-key -n M-'-' split-window -v -c "#{pane_current_path}"

      # Kill pane with ALT+Q
      bind-key -n M-q kill-pane

      # Change window with ALT+1..9 
      run-shell '
        for i in {1..9}; do
            tmux bind-key -n M-$i if-shell "[ \$(tmux list-windows | grep -c ^$i:) -eq 0 ]" "new-window -n \"$i\"" \ "select-window -t $i"
        done
      '
    '';

    plugins = with pkgs.tmuxPlugins; [
      gruvbox
      sensible
      tmux-fzf
    ];
  };

  home.file = {
    ".zshrc".source = ../config/shell/zshrc;
    ".zshenv".source = ../config/shell/zshenv;
    ".zshaliases".source = ../config/shell/zshaliases;
    ".config/fastfetch.jsonc".source = ../config/shell/fastfetch.jsonc;
  };
}
