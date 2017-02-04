''
# these variables should be ones that need to be
# defined regardless of shell; shell-specific
# variables, for example KEYTIMEOUT in zsh, should
# go in shell-specific init files

# directory location
export LOCAL_CONFIG_DIR=/usr/local/etc
export ZSHDIR=$LOCAL_CONFIG_DIR/zsh

# compiler options
export CFLAGS="-Wall -Wextra -std=c11"
export CXXFLAGS="-Wall -Wextra -std=c++14"

# other
EDITOR="nvim"
''

