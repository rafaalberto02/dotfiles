{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    tmux
    git

    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pip
      python-pkgs.setuptools
    ]))

    alacritty
    ripgrep
    wget
    brave
    qbittorrent
    spotify
    vscode
    vscodium
    monitorcontrol
    btop
    stow
    lua
    yq
    jq
    go
    bat
    delta
    chafa
    cmake
    ninja
    mono
    omnisharp-roslyn
    direnv
    fd
    discord
    libgdiplus
    tree
  ];

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  environment.variables = {
    LUA_DIR = "${pkgs.lua}";
  };
}

