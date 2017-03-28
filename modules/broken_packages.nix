{ pkgs, ... }:

{
  nixpkgs.config.allowBroken = true;
  environment.systemPackages = with pkgs; [
    gazeboSimulator.gazebo7
    scilab
    zsh-syntax-highlighting
  ];
}

