{ pkgs, ... }:

let neovim = pkgs.neovim.override {
  vimAlias = false;
  configure = { customRC = ''set rtp +=$USER_CONFIG/neovim |
                             source $USER_CONFIG/neovim/init.vim'';
              };
}; in
{
  environment.systemPackages = with pkgs; [
    neovim
    python35Packages.neovim
  ];
}

