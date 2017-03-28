{ pkgs, ... }:

{
  nixpkgs.config = {
    chromium = {
      enablePepperFlash = true;
      enablePepperPDF   = true;
    };

    firefox = {
      enableGoogleTalkPlugin = true;
      enableAdobeFlash       = true;
    };
  };

  environment.systemPackages = with pkgs; [
    chromium
    deluge
    firefox
  ];
}

