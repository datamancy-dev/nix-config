{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh
    zsh-syntax-highlighting
  ];
}

