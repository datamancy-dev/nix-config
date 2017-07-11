{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tools.security.metasploit
  ];
}

