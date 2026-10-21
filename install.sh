#!/usr/bin/env sh
# Installs the pisa binary from the latest (or a given) release of github.com/Arcware-io/pisa:
# picks the file for this OS and CPU, downloads it and puts it into a directory. No login needed.
#
#   curl -fsSL https://raw.githubusercontent.com/Arcware-io/pisa/main/install.sh | sh
#   sh install.sh [--version vX.Y.Z] [--dir <directory>]
#
# --version  release tag to install (default: the latest release)
# --dir      where to put `pisa` (default: ~/.local/bin)
set -eu

repo="Arcware-io/pisa"
version=""
dir="$HOME/.local/bin"
usage="usage: install.sh [--version vX.Y.Z] [--dir <directory>]"

while [ $# -gt 0 ]; do
    case "$1" in
        --version) version="${2:?$usage}"; shift 2 ;;
        --dir) dir="${2:?$usage}"; shift 2 ;;
        -h|--help) echo "$usage"; exit 0 ;;
        *) echo "$usage" >&2; exit 2 ;;
    esac
done

case "$(uname -s)" in
    Darwin) os="darwin" ;;
    Linux) os="linux" ;;
    *) echo "Unsupported system: $(uname -s) (Windows: install.ps1)" >&2; exit 1 ;;
esac
case "$(uname -m)" in
    arm64|aarch64) arch="arm64" ;;
    x86_64|amd64) arch="x64" ;;
    *) echo "Unsupported CPU: $(uname -m)" >&2; exit 1 ;;
esac
# A shell running under Rosetta reports x86_64 on an Apple Silicon Mac; prefer the native binary.
if [ "$os" = "darwin" ] && [ "$arch" = "x64" ] && [ "$(sysctl -n sysctl.proc_translated 2>/dev/null || echo 0)" = "1" ]; then
    arch="arm64"
fi

asset="pisa-$os-$arch"
if [ -n "$version" ]; then
    url="https://github.com/$repo/releases/download/$version/$asset"
else
    url="https://github.com/$repo/releases/latest/download/$asset"
fi
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

echo "==> $asset ${version:-(latest release)}"
curl -fSL --progress-bar -o "$tmp/$asset" "$url" \
    || { echo "Download failed: $url" >&2; exit 1; }
chmod +x "$tmp/$asset"
mkdir -p "$dir"
mv "$tmp/$asset" "$dir/pisa"
# Only a file downloaded in a browser carries the quarantine flag; harmless if it is absent.
[ "$os" = "darwin" ] && xattr -d com.apple.quarantine "$dir/pisa" 2>/dev/null || true

echo "==> installed $dir/pisa"
"$dir/pisa" --version
case ":$PATH:" in
    *":$dir:"*) ;;
    *) echo "Note: $dir is not in your PATH. Add it, e.g. in ~/.zshrc or ~/.bashrc: export PATH=\"$dir:\$PATH\"" ;;
esac
