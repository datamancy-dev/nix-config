{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    oh-my-zsh
    zsh
  ];

  programs.zsh.promptInit = "";
}

