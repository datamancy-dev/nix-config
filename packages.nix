{ config, pkgs, ... }:

let neovim = pkgs.neovim.override {
  vimAlias = false;
  configure = { customRC = ''set rtp +=$LOCAL_CONFIG_DIR/neovim |
                             source $LOCAL_CONFIG_DIR/neovim/init.vim'';
              };
}; in
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    autoconf
    automake
    baobab
    cargo
    # chromium
    clang
    clojure
    cmake
    cppunit
    ctags
    erlang
    evince
    firefox
    gazebo
    gcc
    gdb
    gimp
    git
    gnome3.gnome-calculator
    gnucash
    gnumake
    gparted
    gnupg1compat
    gtest
    guile
    htop
    keepassx
    leiningen
    libreoffice
    llvm
    manpages
    mercurial
    # metasploit
    mkpasswd
    ncurses
    neovim
    nix-repl
    nox
    npm2nix
    pavucontrol
    pciutils
    # qt5.qtbase
    qt5Full
    qtcreator
    ruby
    rustc
    shutter
    steam
    terminator
    tmux
    unzip
    vim
    wget
    wpa_supplicant
    zip
    # xpad
    zsh
    # zsh-syntax-highlighting
  ];
}

