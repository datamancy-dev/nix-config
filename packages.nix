{ config, pkgs, ... }:

  let neovim = pkgs.neovim.override {
    vimAlias = true;
    configure = { customRC = "set rtp ^=$LOCAL_CONFIG_DIR/neovim | source $LOCAL_CONFIG_DIR/neovim/init.vim"; };
  }; in
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
    cmake
    ctags
    erlang
    evince
    firefox
    gazebo
    gcc
    gimp
    git
    gnome3.gnome-calculator
    gnucash
    gnumake
    gparted
    guile
    leiningen
    libreoffice
    manpages
    # metasploit
    mkpasswd
    ncurses
    neovim
    nox
    npm2nix
    pavucontrol
    pciutils
    qtcreator
    ruby
    rustc
    shutter
    #steam
    terminator
    tmux
    unzip
    wget
    wpa_supplicant
    zip
    # xpad
    zsh
    # zsh-syntax-highlighting
  ];
}

