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
	configuration = { ... }: {
        environment.etc.nix-darwin.source = "/Users/rahenriques/.config/nix-darwin/";
		
        system.configurationRevision = self.rev or self.dirtyRev or null;
        system.stateVersion = 6;
	};
	in
	{
		darwinConfigurations."Rafaels-Mac-mini" = nix-darwin.lib.darwinSystem {
			modules = [ 
                ./modules
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

