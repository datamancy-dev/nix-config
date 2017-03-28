{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    autoconf
    automake
    cargo
    clang
    clojure
    cmake
    cppunit
    ctags
    erlang
    gcc
    gdb
    git
    gnumake
    guile
    leiningen
    llvm
    mercurial
    python3
    qt5Full
    qtcreator
    ruby
    rustc
    valgrind
  ];
}

