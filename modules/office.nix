{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome3.gnome-calculator
    gnucash
    libreoffice
    okular
  ];
}

