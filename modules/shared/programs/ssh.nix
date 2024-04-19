{ lib, ... }:

{
  enable = true;

  extraConfig = lib.mkMerge [
    ''
      Host github.com
        Hostname github.com

      Host mikrofabriken
        Hostname mikrofabriken.se
        User olle
        Port 9571
    ''
    #     IdentitiesOnly yes
    # (lib.mkIf pkgs.stdenv.hostPlatform.isLinux
    #   ''
    #     IdentityFile /home/${user}/.ssh/id_github
    #   '')
    # (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin
    #   ''
    #     IdentityFile /Users/${user}/.ssh/id_github
    #   '')
  ];
}
