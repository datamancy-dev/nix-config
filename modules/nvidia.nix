{ ... }:

{
  hardware.opengl.driSupport32Bit = true;
  services.xserver.videoDrivers = ["nvidia"];
}

