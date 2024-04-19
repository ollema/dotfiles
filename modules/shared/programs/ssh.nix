{ lib, ... }:

{
  enable = true;

  extraConfig = lib.mkMerge [
    ''
      Host mikrofabriken
        Hostname mikrofabriken.se
        User olle
        Port 9571

      Host dlos-server
        HostName vm001570.int.autoheim.net
        User a0001325
      
      Host dlod-server
        HostName vm001571.int.autoheim.net

      Host hal
        HostName hal-login01.dli.int.autoheim.net

    ''
    # Host github.com
    #   Hostname github.com
    #
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
