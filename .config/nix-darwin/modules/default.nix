{
    imports = [ 
        ./packages.nix 
        ./homebrew.nix 
        ./system.nix 
    ];

    environment.etc.nix-darwin.source = "/Users/rahenriques/.config/nix-darwin/";

    programs.zsh.enable = true;

    nix.linux-builder.enable = true;
    nix.settings.experimental-features = "nix-command flakes";
    nix.extraOptions = ''
        extra-platforms = x86_64-darwin aarch64-darwin
        '';
    nixpkgs.config.allowUnfree = true;
    nixpkgs.hostPlatform = "aarch64-darwin";
}

