{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    home-manager.url = "github:nix-community/home-manager";

    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }@inputs:
    let
      stateVersion = "22.11";
    in
    {
      # --------------------------------------------------------------------------
      # nix-darwin configurations (includes home-manager!)
      # --------------------------------------------------------------------------
      # 14" M1 MacBook Pro
      darwinConfigurations.mDYXPYMR2PF =
        let
          username = "s0001325";
          homeDirectory = "/Users/${username}";
          system = "aarch64-darwin";
        in
        darwin.lib.darwinSystem {
          inherit system;
          modules = [
            # nix-darwin module
            (import ./darwin { inherit homeDirectory username; })
            # home-manager module
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = (import ./home { inherit homeDirectory stateVersion username; });
            }
          ];
        };

      # --------------------------------------------------------------------------
      # home-manager configurations (for linux servers)
      # --------------------------------------------------------------------------
      # dlos-server
      homeConfigurations.a0001325 =
        let
          username = "a0001325";
          homeDirectory = "/home/${username}";
          system = "x86_64-linux";
        in
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            # home-manager module
            (import ./home { inherit homeDirectory stateVersion username; })
          ];
        };
    };
}
