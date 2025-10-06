{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      pip
      setuptools
      isort
      pynvim
    ]))

    (pkgs.lua5_1.withPackages (lua-pkgs: with lua-pkgs; [
      luarocks
    ]))
    
    fzf
    neovim
    tmux
    git
    alacritty
    ripgrep
    wget
    qbittorrent
    vscode
    monitorcontrol
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
    direnv
    fd
    discord
    libgdiplus
    tree
    nodejs
    thunderbird
  ];

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  environment.variables = {
    LUA_DIR = "${pkgs.lua}";
  };
}

