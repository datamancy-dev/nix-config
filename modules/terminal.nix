{ pkgs, ... }:

let
  oh-my-zsh-dir = "${pkgs.oh-my-zsh}/share/oh-my-zsh";
  zsh-syntax-highlighting-dir = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/";
in
{
  environment = {
    # extraInit = builtins.readFile ./terminal/environment-variables.sh;
    shellAliases = { ca = "clear && ";
                     cct = "cargo clean && cargo test";
                     ct = "cargo test";
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

      ZSH=oh-my-zsh-dir;
      ZSHDIR="$USER_CONFIG/zsh";

      # compiler options
      CFLAGS="-Wall -Wextra -std=c11";
      CXXFLAGS="-Wall -Wextra -std=c++14";

      # other
      PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH";
    };
  };

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
                             source $USER_CONFIG/zsh/init.zsh
                             source ${oh-my-zsh-dir}/oh-my-zsh.sh
                             source ${zsh-syntax-highlighting-dir}/zsh-syntax-highlighting.zsh

                             # search history when using arrows
                             autoload -U up-line-or-beginning-search
                             autoload -U down-line-or-beginning-search

                             [[ -n "''${key[Up]}" ]] && bindkey "''${key[Up]}" up-line-or-beginning-search
                             [[ -n "''${key[Down]}" ]] && bindkey "''${key[Down]}" down-line-or-beginning-search

                             # advertise 256 color if we have it
                             [[ $COLORTERM = gnome-terminal && ! $TERM = screen-256color ]] && TERM=xterm-256color
                             export TERM
                           '';

  };

  environment.systemPackages = with pkgs; [
    gnupg1compat
    ncurses
    nix-repl
    nox
    p7zip
    terminator
    tmux
    unzip
    vim
    wget
    wpa_supplicant
    zip
    zsh
  ];

  imports = [
    ./oh-my-zsh.nix
    ./zsh-syntax-highlighting.nix
  ];
}

