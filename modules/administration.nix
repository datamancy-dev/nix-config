{ pkgs, ... }:

{
  environment = {
    shellAliases = {
      ds = "nix-shell --command zs";   # ds = development shell
      ec = "sudo nvim /etc/nixos";     # ec = edit configuration
      ed = "nvim $HOME/.human-config"; # ed = edit (user config) directory
      cg = "nix-store --optimize && nix-collect-garbage";         # cg = collect garbage
      ud = "sudo nix-channel --update";   # ud = update
      ug = "sudo nixos-rebuild switch";   # ug = upgrade

      # including a space at the end tells the shell that the next
      # word might be an alias as well
      sudo = "sudo ";
    };

    systemPackages = with pkgs; [
      baobab
      gparted
      htop
      manpages
      mkpasswd
      nixops
      pciutils
    ];
  };
}

