{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    autoconf
    baobab
    cargo
    chromium
    clang
    clojure
    ctags
    erlang
    evince
    firefox
    gcc
    gimp
    git
    gnumake
    gparted
    guile
    leiningen
    libreoffice
    manpages
    # metasploit
    mkpasswd
    ncurses
    nox
    npm2nix
    pavucontrol
    qtcreator
    ruby
    rustc
    shutter
    steam
    terminator
    unzip
    (import ./vim.nix)
    wget
    wpa_supplicant
    zip
    # xpad
    zsh
    # zsh-syntax-highlighting
  ];
}

