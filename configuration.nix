{ pkgs, ... }:

{
  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

  # nonfree software isn't inherrintly evil...
  nixpkgs.config.allowUnfree = true;

  # Use the grub boot loader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub.device = /dev/sda1;
    systemd-boot.enable = true;
  };
  networking.networkmanager.enable = true;  # Enable the network manager

  environment.systemPackages = with pkgs; [
    keepassx
    pavucontrol
    steam
  ];

  networking.firewall.allowedTCPPorts = [ 27036 27037 ];
  networking.firewall.allowedUDPPorts = [ 27031 27036 ];

  hardware = {
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
    opengl.driSupport32Bit = true;
  };

  services.openssh.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  time.timeZone = "America/Vancouver";

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./modules/administration.nix
      ./modules/development.nix
      ./modules/editor.nix
      ./modules/images.nix
      ./modules/office.nix
      ./modules/terminal.nix
      ./modules/users.nix
      ./modules/web.nix
      ./modules/x.nix
    ];
}

