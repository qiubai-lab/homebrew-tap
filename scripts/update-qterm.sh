#!/usr/bin/env bash
# 从 GitHub 最新 release 自动更新 Casks/qterm.rb 的版本号和 sha256
#
# 用法:
#   scripts/update-qterm.sh            仅更新 Casks/qterm.rb
#   scripts/update-qterm.sh --commit   更新并创建 git commit（不自动 push）
set -euo pipefail

REPO="qiubai-lab/Qterm"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CASK="$ROOT/Casks/qterm.rb"

LATEST="$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" \
  | sed -nE 's/.*"tag_name": *"v?([^"]+)".*/\1/p' | head -1)"
CURRENT="$(sed -nE 's/^  version "([^"]+)".*/\1/p' "$CASK" | head -1)"

if [[ -z "$LATEST" ]]; then
  echo "错误: 无法从 GitHub 获取最新 release 版本" >&2
  exit 1
fi

if [[ "$LATEST" == "$CURRENT" ]]; then
  echo "qterm 已是最新版本 ($CURRENT)，无需更新"
  exit 0
fi

echo "发现新版本: $CURRENT -> $LATEST"

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

i=0
for arch in aarch64 x86_64; do
  url="https://github.com/$REPO/releases/download/v${LATEST}/Qterm_${LATEST}_${arch}.dmg"
  echo "下载 $url"
  curl -fsSL -o "$TMP/qterm_${arch}.dmg" "$url"
  sha="$(shasum -a 256 "$TMP/qterm_${arch}.dmg" | cut -d' ' -f1)"
  if [[ $i -eq 0 ]]; then ARM_SHA="$sha"; else INTEL_SHA="$sha"; fi
  i=$((i + 1))
done

# 版本号与两个 sha256（arm 在前、intel 在后，与 cask 中 on_arm/on_intel 顺序一致）
sed -i '' "s/^  version \"[^\"]*\"/  version \"$LATEST\"/" "$CASK"
ARM_SHA="$ARM_SHA" INTEL_SHA="$INTEL_SHA" perl -pi -e '
  BEGIN { @s = ($ENV{ARM_SHA}, $ENV{INTEL_SHA}); $i = 0 }
  s/sha256 "[0-9a-f]{64}"/"sha256 \"" . $s[$i++] . "\""/e
' "$CASK"

echo
echo "已更新 $CASK:"
grep -E 'version|sha256' "$CASK"

if [[ "${1:-}" == "--commit" ]]; then
  git -C "$ROOT" add Casks/qterm.rb
  git -C "$ROOT" commit -m "Update Qterm to $LATEST"
  echo
  echo "已创建提交，确认无误后请手动 git push"
fi
