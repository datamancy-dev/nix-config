# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs.config = {
    # nonfree software isn't inherrintly evil...
    allowUnfree = true;

    chromium = {
      enablePepperFlash = true;
      enablePepperPDF   = true;
    };

    firefox = {
      enableGoogleTalkPlugin = true;
      enableAdobeFlash       = true;
    };
  };

  # Use the grub boot loader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub.device = /dev/sda1;
    systemd-boot.enable = true;
  };
  networking.networkmanager.enable = true;  # Enable the network manager

  programs.zsh = {
    enable = true;
    interactiveShellInit = "source $LOCAL_CONFIG_DIR/zsh/init.zsh";
  };

  environment = { extraInit = (import ./environment-variables.sh);
    shellAliases = { ca = "clear && "; 
                     ec = "sudo nvim /etc/nixos"; # edit configuration
                     gst = "git status --short";
                     sudo = "sudo "; # allows sudo'd commands to be aliases
                     tmux = "tmux -2"; # force 256 colors in tmux
                     tmux-8color = "tmux"; # allow less colors just in case
                     ud = "sudo nix-channel --update"; # ud = update
                     ug = "sudo nixos-rebuild switch"; # ug = upgrade
    };
    shellInit = (import ./environment-variables.sh);
  };

  services = {
    # openssh.enable = true;

    xserver = {
      enable = true;
      layout = "us";

      # desktopManager.gnome.enable = true;
      # displayManager.gdm.enable = true; 

      # desktopManager.enlightenment.enable = true;

      desktopManager.plasma5.enable = true;
      # displayManager.kdm.enable = true;
    };
  };

  time.timeZone = "America/Vancouver";

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # the package list is long enough to justify putting it in a separate file
      ./packages.nix
    ];

  hardware = {
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
    opengl.driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  users = let myUserOptions = 
          {
            hashedPassword = (import "/etc/nixos/password.txt");
            extraGroups = ["wheel"]; isNormalUser   = true;
          }; in
    {
      extraGroups.hab = {};

      defaultUserShell = "/run/current-system/sw/bin/zsh";
      mutableUsers     = false;

      users = {
        saffronsnail = myUserOptions;

        hab = {
          extraGroups = ["hab"];
          password="hab";
        };
      };
    };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";
}

