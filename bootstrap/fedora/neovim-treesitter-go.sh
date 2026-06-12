#!/usr/bin/env bash

# Build the Go Tree-sitter parser and install it with queries for Neovim.
# Requires tree-sitter-cli (installed via bootstrap/fedora/tools.sh).

set -eu

TREE_SITTER_GO_REPO="https://github.com/tree-sitter/tree-sitter-go.git"
DOTFILES="$HOME/dotfiles"
NVIM_CONFIG="$DOTFILES/config/nvim"
PARSER_DIR="$NVIM_CONFIG/parser"
QUERIES_DIR="$DOTFILES/config/nvim/queries/go"
BUILD_DIR="$(mktemp -d)"

cleanup() {
	rm -rf "$BUILD_DIR"
}
trap cleanup EXIT

if ! command -v tree-sitter >/dev/null; then
	echo "tree-sitter CLI not found; install tree-sitter-cli first" >&2
	exit 1
fi

git clone --depth=1 "$TREE_SITTER_GO_REPO" "$BUILD_DIR/tree-sitter-go"
(
	cd "$BUILD_DIR/tree-sitter-go"
	tree-sitter build -o go.so
)

mkdir -p "$PARSER_DIR" "$QUERIES_DIR"
cp "$BUILD_DIR/tree-sitter-go/go.so" "$PARSER_DIR/go.so"
cp "$BUILD_DIR/tree-sitter-go/queries/highlights.scm" \
	"$BUILD_DIR/tree-sitter-go/queries/tags.scm" \
	"$QUERIES_DIR/"

echo "Installed Go Tree-sitter parser to $PARSER_DIR/go.so"
echo "Installed Go Tree-sitter queries to $QUERIES_DIR/"
