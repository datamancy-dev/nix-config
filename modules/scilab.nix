{ pkgs, ... }:

{
  nixpkgs.config.allowBroken = true;
  environment.systemPackages = [ pkgs.scilab ];
}

