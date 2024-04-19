{ pkgs, ... }:

{
  enable = true;
  settings = {
    shell.program = "${pkgs.fish}/bin/fish";
  };
}
