{ pkgs, ... }:

{
  users = {
    extraGroups.guixbuilder = {};

    defaultUserShell = "/run/current-system/sw/bin/zsh";
    mutableUsers     = false;

    users =
    let guixbuilderattrs = {
        # shell = pkgs.nologin;
        group = "guixbuilder";
        extraGroups = [ "guixbuilder" ];

        createHome = false;
        isSystemUser = true;
    }; in {
      saffronsnail =
      {
        hashedPassword = (import ../passwords/saffronsnail.txt);
        extraGroups    = ["vboxusers" "wheel"];
        isNormalUser   = true;
      };

      guixbuilder01 = guixbuilderattrs;
      guixbuilder02 = guixbuilderattrs;
      guixbuilder03 = guixbuilderattrs;
      guixbuilder04 = guixbuilderattrs;
      guixbuilder05 = guixbuilderattrs;
      guixbuilder06 = guixbuilderattrs;
      guixbuilder07 = guixbuilderattrs;
      guixbuilder08 = guixbuilderattrs;
      guixbuilder09 = guixbuilderattrs;
      guixbuilder10 = guixbuilderattrs;
      guixbuilder11 = guixbuilderattrs;
      guixbuilder12 = guixbuilderattrs;
      guixbuilder13 = guixbuilderattrs;
      guixbuilder14 = guixbuilderattrs;
      guixbuilder15 = guixbuilderattrs;
      guixbuilder16 = guixbuilderattrs;
      guixbuilder17 = guixbuilderattrs;
      guixbuilder18 = guixbuilderattrs;
      guixbuilder19 = guixbuilderattrs;
      guixbuilder20 = guixbuilderattrs;
    };
  };
}

