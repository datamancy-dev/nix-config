''
# these variables should be ones that need to be
# defined regardless of shell; shell-specific
# variables, for example KEYTIMEOUT in zsh, should
# go in shell-specific init files

# directory locations
export LOCAL_CONFIG_DIR="/etc/nixos/etc"
export CONF=$LOCAL_CONFIG_DIR # abbreviation
export XDG_CONFIG_DIRS="$LOCAL_CONFIG_DIR:$XDG_CONFIG_DIRS"

export ZSHDIR=$LOCAL_CONFIG_DIR/zsh

# compiler options
export CFLAGS="-Wall -Wextra -std=c11"
export CXXFLAGS="-Wall -Wextra -std=c++14"

# other
export EDITOR="nvim"
export PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin"
''

