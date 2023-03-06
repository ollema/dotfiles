{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }@inputs:
    let
      # constants 
      username = "s0001325";
      homeDirectory = "/Users/${username}";
      system = "aarch64-darwin";
      stateVersion = "22.11";

      # nixpkgs
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true; # for vscode and other unfree pkgs
          xdg = { configHome = homeDirectory; }; # TODO: not sure if this is needed
        };
      };

      # modules
      home-manager-user-module = import ./home { inherit homeDirectory pkgs stateVersion system username; };
      nix-darwin-module = import ./darwin { inherit pkgs; };
    in {
      darwinConfigurations.mDYXPYMR2PF = darwin.lib.darwinSystem {
        inherit system;
        modules = [
          nix-darwin-module
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = home-manager-user-module;
          }
        ];
      };
    };
}
