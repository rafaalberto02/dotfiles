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
  ];

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
}

