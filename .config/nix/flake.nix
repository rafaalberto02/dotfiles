{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, mac-app-util }:
    let
      configuration = { pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;

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

          msbuild
          (with dotnetCorePackages; combinePackages [
            sdk_9_0
            sdk_10_0
          ])

          glfw
          sdl3
          jdk25

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
          cmake
          pkg-config
          gdb

          alacritty
          neovim
          qbittorrent
          discord
          monitorcontrol
          obsidian
        ];

        fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

        homebrew = {
          enable = true;
          casks = [
            "windows-app"
            "microsoft-teams"
            "ungoogled-chromium"
            "obs"
            "spotify"
          ];
          taps = [ ];
          brews = [
          ];
          onActivation = {
            autoUpdate = true;
            upgrade = true;
            cleanup = "zap";
          };
        };

        programs.zsh.enable = true;

        environment.variables = {
          LUA_DIR = "${pkgs.lua}";
          DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_10_0}/share/dotnet/";
        };

        nix.settings.experimental-features = "nix-command flakes";

        system.configurationRevision = self.rev or self.dirtyRev or null;

        system.stateVersion = 6;
        system.primaryUser = "rahenriques";
        system.defaults = {
          dock = {
            autohide = true;
            mru-spaces = false;
            show-recents = false;
            static-only = true;
            persistent-others = [
              "~/Documents"
              "~/Downloads"
            ];
          };
          finder = {
            AppleShowAllExtensions = true;
            AppleShowAllFiles = true;
            CreateDesktop = false;
            ShowExternalHardDrivesOnDesktop = false;
            ShowHardDrivesOnDesktop = false;
            ShowMountedServersOnDesktop = false;
            ShowRemovableMediaOnDesktop = false;
            ShowPathbar = true;
          };
          NSGlobalDomain = {
            "com.apple.swipescrolldirection" = false;
            _HIHideMenuBar = true;
          };
        };

        nixpkgs.hostPlatform = "aarch64-darwin";

        services.aerospace = {
          enable = true;
          settings = {
            mode.main.binding = {
              alt-h = "focus left";
              alt-j = "focus down";
              alt-k = "focus up";
              alt-l = "focus right";
              alt-shift-h = "move left";
              alt-shift-j = "move down";
              alt-shift-k = "move up";
              alt-shift-l = "move right";
              alt-minus = "resize smart -50";
              alt-equal = "resize smart +50";
              alt-1 = "workspace 1";
              alt-2 = "workspace 2";
              alt-3 = "workspace 3";
              alt-4 = "workspace 4";
              alt-5 = "workspace 5";
              alt-6 = "workspace 6";
              alt-7 = "workspace 7";
              alt-8 = "workspace 8";
              alt-9 = "workspace 9";
              alt-shift-1 = "move-node-to-workspace 1";
              alt-shift-2 = "move-node-to-workspace 2";
              alt-shift-3 = "move-node-to-workspace 3";
              alt-shift-4 = "move-node-to-workspace 4";
              alt-shift-5 = "move-node-to-workspace 5";
              alt-shift-6 = "move-node-to-workspace 6";
              alt-shift-7 = "move-node-to-workspace 7";
              alt-shift-8 = "move-node-to-workspace 8";
              alt-shift-9 = "move-node-to-workspace 9";
            };
          };
        };
      };
    in
    {
      darwinConfigurations."Rafaels-Mac-mini" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          mac-app-util.darwinModules.default
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "rahenriques";
            };
          }
        ];
      };
    };
}
