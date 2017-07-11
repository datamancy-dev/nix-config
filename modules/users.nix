{ ... }:

{
  users = {
    extraGroups.hab = {};

    defaultUserShell = "/run/current-system/sw/bin/zsh";
    mutableUsers     = false;

    users = {
      saffronsnail =
      {
        hashedPassword = (import ../passwords/saffronsnail.txt);
        extraGroups    = ["vboxusers" "wheel"];
        isNormalUser   = true;
      };

      smakems =
      {
        hashedPassword = (import ../passwords/smakems.txt);
        isNormalUser   = true;
      };

      brocas =
      {
        hashedPassword = (import ../passwords/brocas.txt);
        isNormalUser   = true;
      };

      hab = {
        extraGroups = ["hab"];
        password="hab";
      };
    };
  };
}

