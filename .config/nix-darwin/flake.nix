{
	description = "nix-darwin system flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		
		nix-darwin.url = "github:LnL7/nix-darwin/master";
		nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

		mac-app-util.url = "github:hraban/mac-app-util";

		nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
	};

	outputs = inputs@{ self, nixpkgs, nix-darwin, mac-app-util, nix-homebrew }:

	let
	configuration = { pkgs, ... }: {
		environment.systemPackages = [
			pkgs.neovim
			pkgs.tmux
			pkgs.git
			pkgs.python3
			pkgs.alacritty
			pkgs.fzf
			pkgs.ripgrep
			pkgs.wget
			pkgs.skhd
			pkgs.yabai
			pkgs.brave
			pkgs.qbittorrent
			pkgs.spotify
			pkgs.vscode
			pkgs.vscodium
			pkgs.monitorcontrol
			pkgs.btop
			pkgs.stow
		];

        environment = {
            variables = {
                HOMEBREW_NO_ANALYTICS = "1";
                HOMEBREW_NO_INSECURE_REDIRECT = "1";
                HOMEBREW_NO_EMOJI = "1";
                HOMEBREW_NO_ENV_HINTS = "0";
            };
        };

		homebrew = {
            enable = true;
            casks = [
                "libreoffice"
				"tidal"
				"whatsapp"
				"microsoft-teams"
				"thunderbird"
				"bitwarden"
				"firefox"
			];
            onActivation = {
                autoUpdate = true;
                upgrade = true;
                cleanup = "zap";
            };
            caskArgs.require_sha = true;
		};
		
        fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

		nixpkgs.config.allowUnfree = true;

		nix.linux-builder.enable = true;
		nix.settings.experimental-features = "nix-command flakes";
		nix.extraOptions = ''
			extra-platforms = x86_64-darwin aarch64-darwin
			'';
		system.activationScripts.extraActivation.text = ''
			softwareupdate --install-rosetta --agree-to-license
			'';
		system.activationScripts.postUserActivation.text = ''
			/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u;
		defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false            
			defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false    
			defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false       
			defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false 
			'';

		programs.zsh.enable = true;

		networking.wakeOnLan.enable = false;

		system.configurationRevision = self.rev or self.dirtyRev or null;
		system.stateVersion = 6;

		system.defaults = {
			# Firewall
			alf.globalstate = 1;

			dock.mru-spaces = false;
			dock.enable-spring-load-actions-on-all-items = true;
			dock.appswitcher-all-displays = true;
			dock.launchanim = false;
			dock.magnification = true;
			dock.mineffect = "scale";
			dock.minimize-to-application = false;
			dock.mouse-over-hilite-stack = true;
			dock.show-recents = false;

			dock.largesize = 16;

			dock.autohide = true;
			dock.autohide-delay = 0.24;
			dock.autohide-time-modifier = 1.0;

			dock.expose-group-apps = true;
			dock.expose-animation-duration = 1.0;

			dock.static-only = false;
			dock.persistent-apps = [
			{
				app = "/System/Applications/Launchpad.app";
			}
			];

			finder.AppleShowAllExtensions = true;
			finder.FXPreferredViewStyle = "clmv";
			finder.ShowPathbar = true;
			finder.ShowStatusBar = true;

			screencapture.location = "~/Pictures/screenshots";
			screensaver.askForPasswordDelay = 10;

			NSGlobalDomain.AppleShowScrollBars = "WhenScrolling";
			NSGlobalDomain."com.apple.swipescrolldirection" = false;
			NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
			NSGlobalDomain."com.apple.sound.beep.volume" = 0.0;
			NSGlobalDomain."com.apple.sound.beep.feedback" = 0;

			controlcenter.AirDrop = false;
			controlcenter.Bluetooth = false;
			controlcenter.Display = false;
			controlcenter.NowPlaying = false;
			controlcenter.FocusModes = true;
			controlcenter.Sound = true;

			menuExtraClock.FlashDateSeparators = true;
			menuExtraClock.Show24Hour = true;
			menuExtraClock.ShowDate = 1;
			menuExtraClock.ShowDayOfMonth = true;
		};


		nixpkgs.hostPlatform = "aarch64-darwin";
	};
	in
	{
		# Build darwin flake using:
		# $ darwin-rebuild build --flake .#Rafas-Mac-mini
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
				}];
		};

		darwinPackages = self.darwinConfigurations."Rafaels-Mac-mini".pkgs;
	};
}

