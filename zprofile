# Mac Specific
alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"

# Some random Mac Thing
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# C66
export PATH="/opt/cloud66/bin:${PATH}"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Shortcuts to code repos
alias docs='cd ~/Code/val-doc-storage'
alias barcoder='cd ~/Code/val-barcoder'

# Postgres
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig"
