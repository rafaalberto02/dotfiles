{ pkgs, ... }:
{
  imports = [ 
    ./shared/packages.nix 
    ./homebrew.nix 
  ];

  environment.etc.nix-darwin.source = "/Users/rahenriques/.config/nix-darwin/";

  programs.zsh.enable = true;

  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 6;
  system.primaryUser = "rahenriques";
}

