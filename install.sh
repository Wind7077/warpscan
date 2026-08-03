#!/bin/bash
OS=$(uname -s)
if [ "$OS" != "Linux" ]; then
 echo "Only Linux/Android"
 exit 1
fi
ARCH=$(uname -m)
case "$ARCH" in
 aarch64|arm64) ARCH="arm64" ;;
 armv7*|armv8*) ARCH="arm" ;;
 x86_64) ARCH="amd64" ;;
 i386|i686) ARCH="386" ;;
 *) echo "Unsupported: $ARCH" && exit 1 ;;
esac
echo "========================================"
echo "BPB Warp Scanner - MTS Edition"
echo "Amnezia: Jc=4, Jmin=40, Jmax=70"
echo "========================================"
echo ""
BINARY="BPB-Warp-Scanner"
ARCHIVE="${BINARY}-linux-${ARCH}.tar.gz"
echo "Downloading..."
curl -L -# -o "${ARCHIVE}" "https://github.com/bia-pain-bache/BPB-Warp-Scanner/releases/latest/download/${ARCHIVE}"
tar xzf "./${ARCHIVE}"
echo ""
echo "Ready! Run: ./${BINARY}"
