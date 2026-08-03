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
echo "========================================"
echo ""
echo "Select Amnezia profile for MTS:"
echo "  1) Standard (Jc=4, Jmin=40, Jmax=70)"
echo "  2) Aggressive (Jc=6, Jmin=30, Jmax=80)"
echo "  3) Conservative (Jc=3, Jmin=50, Jmax=90)"
echo "  4) Custom"
echo ""
read -p "Your choice (1-4) [1]: " profile
profile=${profile:-1}

case $profile in
 1) JC=4; JMIN=40; JMAX=70 ;;
 2) JC=6; JMIN=30; JMAX=80 ;;
 3) JC=3; JMIN=50; JMAX=90 ;;
 4)
   read -p "Jc [4]: " JC; JC=${JC:-4}
   read -p "Jmin [40]: " JMIN; JMIN=${JMIN:-40}
   read -p "Jmax [70]: " JMAX; JMAX=${JMAX:-70}
   ;;
 *) JC=4; JMIN=40; JMAX=70 ;;
esac

echo ""
echo "Profile: Jc=$JC, Jmin=$JMIN, Jmax=$JMAX"
echo ""

BINARY="BPB-Warp-Scanner"
ARCHIVE="${BINARY}-linux-${ARCH}.tar.gz"

echo "Downloading..."
curl -L -# -o "${ARCHIVE}" "https://github.com/bia-pain-bache/BPB-Warp-Scanner/releases/latest/download/${ARCHIVE}"
tar xzf "./${ARCHIVE}"

echo ""
echo "Ready! Run: ./${BINARY}"
echo "Config: Amnezia Jc=$JC, Jmin=$JMIN, Jmax=$JMAX"
