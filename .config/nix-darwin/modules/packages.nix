{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    tmux
    git
    python3
    alacritty
    fzf
    ripgrep
    wget
    skhd
    yabai
    brave
    qbittorrent
    spotify
    vscode
    vscodium
    monitorcontrol
    btop
    stow
    ripgrep
    kitty
    lua
    yq
    jq
  ];

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  environment.variables = {
    LUA_DIR = "${pkgs.lua}";
  };
}

