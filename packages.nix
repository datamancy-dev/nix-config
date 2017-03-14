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
    p7zip
    autoconf
    automake
    baobab
    cargo
    chromium
    clang
    clojure
    cmake
    cppunit
    ctags
    deluge
    erlang
    evince
    firefox
    # gazeboSimulator.gazebo7
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
    gvfs # required for evince to remember the page that the pdf is 'open' to
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
    nixops
    nox
    npm2nix
    pavucontrol
    pciutils
    qpdfview
    qt5Full
    qtcreator
    ruby
    rustc
    shutter
    steam
    terminator
    tmux
    unzip
    valgrind
    vim
    wget
    wpa_supplicant
    zip
    # xpad
    zsh
    # zsh-syntax-highlighting
  ];
}

