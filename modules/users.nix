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
        extraGroups    = ["wheel"];
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

