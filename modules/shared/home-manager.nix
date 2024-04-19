{ config, pkgs, lib, ... }:

let
  name = "Olle Månsson";
  user = "s0001325";
  email = "31876997+ollema@users.noreply.github.com";
in
{
  # terminal emulator
  alacritty = import ./programs/alacritty.nix { inherit pkgs; };

  # cat replacement
  bat = import ./programs/bat.nix;

  # ls replacement
  eza = import ./programs/eza.nix;

  # fish shell
  fish = import ./programs/fish.nix;

  # git
  git = import ./programs/git.nix { inherit name email; };

  # starship prompt
  starship = import ./programs/starship.nix;

  ssh = {
    enable = true;

    extraConfig = lib.mkMerge [
      ''
        Host github.com
          Hostname github.com
          IdentitiesOnly yes
      ''
      # (lib.mkIf pkgs.stdenv.hostPlatform.isLinux
      #   ''
      #     IdentityFile /home/${user}/.ssh/id_github
      #   '')
      # (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin
      #   ''
      #     IdentityFile /Users/${user}/.ssh/id_github
      #   '')
    ];
  };
}
