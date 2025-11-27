{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      pip
      setuptools
      isort
      pynvim
    ]))

    lua
    (pkgs.lua5_1.withPackages (lua-pkgs: with lua-pkgs; [
      luarocks
    ]))

    nodejs
    go
    mono
    cargo

    tmux
    git
    wget

    fzf
    yq
    jq
    bat
    fd
    tree
    delta
    chafa
    stow
    direnv
    ripgrep
    uncrustify

    alacritty
    neovim
    qbittorrent
    discord
    monitorcontrol
    thunderbird
  ];

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  environment.variables = {
    LUA_DIR = "${pkgs.lua}";
  };
}

