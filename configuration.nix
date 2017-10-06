{ config, pkgs, ... }:

{
  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

  # save a copy of the configuration just in case
  system.copySystemConfiguration = true;

  # nonfree software isn't inherrintly evil...
  nixpkgs.config.allowUnfree = true;

  # Use the grub boot loader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub.device = /dev/sda1;
    grub.extraEntries = ''
      menuentry "Windows 10" {
        chainloader(hd0,3)+1
      }
    '';
    systemd-boot.enable = true;

  };
  networking.networkmanager.enable = true;  # Enable the network manager
  # networking.nameservers = [ "208.76.142.1" "208.76.152.9" "66.235.59.7"];

  environment.systemPackages = with pkgs; [
    baobab
    exfat
    git
    keepassx
    quiterss
    steam
    texlive.combined.scheme-full
    thunderbird
    xboxdrv
  ];

  networking.firewall.allowedTCPPorts = [ 27036 27037 ];
  networking.firewall.allowedUDPPorts = [ 27031 27036 ];

  services.openssh.enable = true;
  time.timeZone = "America/Vancouver";

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./modules/administration.nix
      ./modules/audio.nix
      # I use guix for development tools now ./modules/development.nix
      ./modules/editor.nix
      ./modules/images.nix
      # This is broken (see issue 29946) ./modules/nvidia.nix
      ./modules/office.nix
      ./modules/terminal.nix
      ./modules/users.nix
      ./modules/web.nix
      ./modules/x.nix
    ];
  boot.postBootCommands =  "/var/guix/profiles/per-user/root/guix-profile/bin/guix-daemon --build-users-group=${config.users.users.guixbuilder01.group} &";
}

