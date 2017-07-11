{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    androidndk
    androidsdk
    android-studio
    ant
    openjdk
  ];
}

