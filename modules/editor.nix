{ pkgs, ... }:

let neovim = pkgs.neovim.override {
  configure = {
    customRC = ''set rtp +=$USER_CONFIG/neovim |
                   source $USER_CONFIG/neovim/init.vim'';
    vam.pluginDictionaries = [
      # enhanced status bar
      { name = "vim-airline"; }

      # enahanced syntax highlighting for c-family languages using clang
      # FIXME { name = "Clamp"; }

      # adds an operator for toggling commenting
      { name = "commentary"; }

      # search for files in project
      { name = "ctrlp"; }

      # code-completion that takes advantage of neovim's async abilities
      # if you want to use it disable YouCompleteMe
      # { name = "deoplete.nvim"; }

      # enhance c/c++ completion with Clang
      # FIXME { name = "deoplete-clang"; }

      # auto-generate doxygen comments
      # FIXME { name = "DoxygenToolkit.vim"; }

      # shows git changes
      { name = "vim-gitgutter"; }

      # prevent repeated uses of hjkl
      { name = "vim-hardtime"; }

      # wrapper around libclang for vimscript
      # FIXME { name = "libclang-vim"; }

      # dependency for other xolox plugins...
      { name = "vim-misc"; }

      # lint asynchronously (and more?)
      { name = "neomake"; }

      # well-designed color scheme (see http://ethanschoonover.com/solarized)
      # FIXME { name = "neovim-colors-solarized-truecolor-only"; }

      # nix syntax highlighting and filetype detection
      { name = "vim-nix"; }

      # FIXME { name = "vim-notes"; }

      # rust syntax highlighting
      # FIXME { name = "rust.vim"; }

      # a community repository of snippets for a variety of languages
      { name = "vim-snippets"; }

      # enahanced tab completion; unfortunately incompatible with YouCompleteMe
      { name = "supertab"; }

      # text objects for c/c++
      # FIXME { name = "vim-textobj-clang"; }

      # toml syntax
      # FIXME { name = "vim-toml"; }

      # eases user-defined text objects; dependency of vim-textobj-clang
      # FIXME { name = "vim-textobj-user"; }

      # use <C-{h,j,k,l,\}> to navigate panes (removes the <C-w> prefix)
      { name = "vim-tmux-navigator"; }

      # snippets allow code completion based on templates (see vim-snippets)
      # FIXME { name = "ultisnips"; }

      # scroll through things with ][
      # FIXME { name = "vim-unimpaired"; }

      # popular completion plugin; if you want to enable it disable deoplete
      # { name = "YouCompleteMe"; }
    ];
  };
  vimAlias = true;
}; in
{
  environment.systemPackages = with pkgs; [
    neovim
    python27Packages.neovim
    python35Packages.neovim
  ];
}

