# https://github.com/asdf-vm/asdf-erlang
#
sudo dnf install -y git gcc g++ automake autoconf ncurses-devel wxGTK-devel wxBase openssl-devel \
    java-1.8.0-openjdk-devel libiodbc unixODBC-devel.x86_64 erlang-odbc.x86_64 libxslt fop

mise plugin install elixir https://github.com/mise-plugins/mise-elixir.git

# mise ls-remote erlang
# mise use -g erlang@27.2
# mise ls-remote elixir
# mise use -g elixir@1.18.2
