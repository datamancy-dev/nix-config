# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let myUserOptions = 
{
  hashedPassword = "$6$Symhg7JQRnY$EJEJuk/1uGAtDH1HJlmkCE23tG5Hly56v0FxoWJTrsrdFfzsgNvZ7V/8kKy9t7gf7vX8Bt8X73pnYv9FzKOHP1";
  extraGroups = ["wheel"]; isNormalUser   = true; }; in
{
  nixpkgs.config = {
    # nonfree software isn't inherrintly evil...
    allowUnfree = true;

    chromium = {
      enablePepperFlash = true;
      enablePepperPDF   = true;
    };

    firefox = {
      enableGnomeExtensions = true;
    };
  };

  # Use the gummiboot efi boot loader.
  boot.loader = {
    gummiboot.enable = true;
    efi.canTouchEfiVariables = true;
    grub.device = /dev/sda5;
  };
networking.networkmanager.enable = true;  # Enable the network manager

  programs.zsh = {
    enable = true;
    interactiveShellInit = (import ./zshrc);
  };

  environment.extraInit = ''
    ZSH=/home/share/zsh/oh-my-zsh
  '';

  services = {
    # openssh.enable = true;

    xserver = {
      enable = true;
      layout = "us";
      desktopManager.gnome3.enable = true;
      displayManager.gdm.enable = true; # it doesn't recongize the right passwords?!?!
    };
  };

  time.timeZone = "America/Vancouver";

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
    ];

  hardware = {
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
    opengl.driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  users = {
    extraGroups.hab = {};

    defaultUserShell = "/run/current-system/sw/bin/zsh";
    mutableUsers     = false;

    users = {
      activism   = myUserOptions;
      freelance  = myUserOptions;
      hackerrank = myUserOptions;
      llvm       = myUserOptions;
      metasploit = myUserOptions;
      personal   = myUserOptions;
      wgu        = myUserOptions;

      hab = {
        extraGroups = ["hab"];
        password="hab";
      };
    };
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";
}

