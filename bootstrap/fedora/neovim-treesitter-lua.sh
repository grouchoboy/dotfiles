#!/usr/bin/env bash

# Build the Lua Tree-sitter parser and install it with queries for Neovim.
# Requires tree-sitter-cli (installed via bootstrap/fedora/tools.sh).

set -eu

TREE_SITTER_LUA_REPO="https://github.com/tree-sitter-grammars/tree-sitter-lua.git"
DOTFILES="$HOME/dotfiles"
NVIM_CONFIG="$DOTFILES/config/nvim"
PARSER_DIR="$NVIM_CONFIG/parser"
QUERIES_DIR="$DOTFILES/config/nvim/queries/lua"
BUILD_DIR="$(mktemp -d)"

cleanup() {
	rm -rf "$BUILD_DIR"
}
trap cleanup EXIT

if ! command -v tree-sitter >/dev/null; then
	echo "tree-sitter CLI not found; install tree-sitter-cli first" >&2
	exit 1
fi

git clone --depth=1 "$TREE_SITTER_LUA_REPO" "$BUILD_DIR/tree-sitter-lua"
(
	cd "$BUILD_DIR/tree-sitter-lua"
	tree-sitter build -o lua.so
)

mkdir -p "$PARSER_DIR" "$QUERIES_DIR"
cp "$BUILD_DIR/tree-sitter-lua/lua.so" "$PARSER_DIR/lua.so"
cp "$BUILD_DIR/tree-sitter-lua/queries/"*.scm "$QUERIES_DIR/"

echo "Installed Lua Tree-sitter parser to $PARSER_DIR/lua.so"
echo "Installed Lua Tree-sitter queries to $QUERIES_DIR/"
