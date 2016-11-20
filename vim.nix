with import <nixpkgs> {};

vim_configurable.customize {
  # Specifies the name that opens this configuration of vim
  name = "vim";
  vimrcConfig.customRC = (import ./vimrc);
}

