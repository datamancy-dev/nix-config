{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.pavucontrol ];
  hardware = {
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
  };
}

