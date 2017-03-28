{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xclip
  ];

  services.xserver = {
    enable = true;
    layout = "us";

    # Enlightenment
    # desktopManager.enlightenment.enable = true;

    # Gnome
    # desktopManager.gnome.enable = true;
    # displayManager.gdm.enable = true;

    # KDE Services
    desktopManager.plasma5.enable = true;
    # displayManager.kdm.enable = true;
  };
}

