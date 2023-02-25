{
  inputs = {
    # -------------------------------------------------------------------------
    # nixpkgs input
    # -------------------------------------------------------------------------
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # -------------------------------------------------------------------------
    # nix-darwin input
    # -------------------------------------------------------------------------
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # -------------------------------------------------------------------------
    # home-manager input
    # -------------------------------------------------------------------------
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }@inputs: {
    # -------------------------------------------------------------------------
    # darwin configurations
    # -------------------------------------------------------------------------
    darwinConfigurations.mDYXPYMR2PF = darwin.lib.darwinSystem {
      system = "aarch64-darwin"; # M1 processor
      modules = [
        # ---------------------------------------------------------------------
        # nix-darwin module
        # ---------------------------------------------------------------------
        ./darwin

        # ---------------------------------------------------------------------
        # home-manager module
        # ---------------------------------------------------------------------
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.s0001325 = import ./home;
        }
      ];
    };
  };
}
