{ pkgs }:

with pkgs;
let shared-packages = import ../shared/packages.nix { inherit pkgs; }; in
shared-packages ++ [
  dockutil
  iina
] ++ (with pkgs.nerdfonts; [
  (override {
    fonts = [
      "CascadiaCode"
      "FiraCode"
      "Iosevka"
    ];
  })
])
