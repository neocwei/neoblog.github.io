#!/bin/zsh
# 一次性同步脚本（2026-09-13 英文迁移时使用，保留作参考）
# 通过 GitHub Contents API 删除中文文章/旧脚本并推送英文内容
set -e
REPO="repos/neocwei/neocwei.github.io/contents"
cd "$(dirname "$0")/.."

enc() { python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$1"; }

del() {
  local f="$1" msg="$2"
  local p=$(enc "$f")
  local sha=$(gh api "$REPO/$p" --jq '.sha' 2>/dev/null || true)
  [[ "$sha" =~ ^[0-9a-f]{40}$ ]] || { echo "SKIP(not found) $f"; return 0; }
  printf '{"message":"%s","sha":"%s"}' "$msg" "$sha" > /tmp/hexo-push-body.json
  gh api -X DELETE "$REPO/$p" --input /tmp/hexo-push-body.json --jq '.commit.sha'
  echo "DELETED $f"
}

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

MSG="博客转为全英文"
MSG2="迁移脚本到 tools 目录（避免被 Hexo 当作插件加载）"
del "source/_posts/你好，世界.md" "$MSG"
del "source/_posts/逃离化工-我的Python第一年.md" "$MSG"
del "source/_posts/世界此刻-AP要闻速览-2026-09-13.md" "$MSG"
del "scripts/push-via-api.sh" "$MSG2"
put "source/_posts/hello-world.md" "$MSG"
put "source/_posts/escaping-chemical-engineering-my-first-year-of-python.md" "$MSG"
put "source/_posts/the-world-right-now-ap-news-digest.md" "$MSG"
put "source/about/index.md" "$MSG"
put "_config.yml" "$MSG"
put "themes/neo/layout/layout.njk" "$MSG"
put "tools/push-via-api.sh" "$MSG2"
echo ALL_DONE
