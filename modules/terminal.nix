{ pkgs, ... }:

{
  environment = {
    # extraInit = builtins.readFile ./terminal/environment-variables.sh;
    shellAliases = { ca = "clear && ";
                     ft = "grep 2> /dev/random -rn . -e ";
                     gst = "git status --short";
                     rs   = "source $USER_CONFIG/zsh/init.zsh";
                     sudo = "sudo "; # allows sudo'd commands to be aliases
                     tmux = "tmux -2"; # force 256 colors in tmux
                     tmux-8color = "tmux"; # allow less colors just in case
    };
    variables = {
      # directory locations
      USER_CONFIG="$HOME/.human-config";
      CONF="$USER_CONFIG";
      XDG_CONFIG_DIRS="$USER_CONFIG:$XDG_CONFIG_DIRS";

      ZSHDIR="$USER_CONFIG/zsh";

      # compiler options
      CFLAGS="-Wall -Wextra -std=c11";
      CXXFLAGS="-Wall -Wextra -std=c++14";

      # other
      EDITOR="nvim";
      PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH";
    };
  };

  programs.zsh = {
    enable = true;
    interactiveShellInit = "source $USER_CONFIG/zsh/init.zsh";
  };

  environment.systemPackages = [
    pkgs.gnupg1compat
    pkgs.ncurses
    pkgs.nix-repl
    pkgs.nox
    pkgs.p7zip
    pkgs.terminator
    pkgs.tmux
    pkgs.unzip
    pkgs.vim
    pkgs.wget
    pkgs.wpa_supplicant
    pkgs.zip
    pkgs.zsh
  ];
}

