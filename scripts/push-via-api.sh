#!/bin/zsh
# 用法: zsh scripts/push-via-api.sh <文件1> <文件2> ...
# 通过 GitHub Contents API 推送文件（本机 git 直连 github.com 不通时的替代通道）
set -e
REPO="repos/neocwei/neoblog.github.io/contents"
cd "$(dirname "$0")/.."

enc() { python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$1"; }

put() {
  local f="$1" msg="$2"
  local p=$(enc "$f")
  local b64=$(base64 -i "$f" | tr -d '\n')
  local body=/tmp/hexo-push-body.json
  local sha=$(gh api "$REPO/$p" --jq '.sha' 2>/dev/null || true)
  [[ "$sha" =~ ^[0-9a-f]{40}$ ]] || sha=""
  if [ -n "$sha" ]; then
    printf '{"message":"%s","content":"%s","sha":"%s"}' "$msg" "$b64" "$sha" > "$body"
  else
    printf '{"message":"%s","content":"%s"}' "$msg" "$b64" > "$body"
  fi
  gh api -X PUT "$REPO/$p" --input "$body" --jq '.commit.sha'
  echo "OK $f"
}

MSG="${MSG:-更新博客}"
if [ $# -eq 0 ]; then
  echo "用法: $0 <文件...>"; exit 1
fi
for f in "$@"; do put "$f" "$MSG"; done
echo ALL_DONE
