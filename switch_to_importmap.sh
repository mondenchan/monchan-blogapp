#!/bin/bash

echo "=== Importmap に統一するクリーンアップを開始します ==="

# 1. 不要な builds/application.js を削除
if [ -f app/assets/builds/application.js ]; then
  rm app/assets/builds/application.js
  echo "削除: app/assets/builds/application.js"
fi
if [ -f app/assets/builds/application.js.gz ]; then
  rm app/assets/builds/application.js.gz
  echo "削除: app/assets/builds/application.js.gz"
fi

# 2. manifest.js から link_tree ../builds を削除
if [ -f app/assets/config/manifest.js ]; then
  sed -i.bak '/link_tree ..\/builds/d' app/assets/config/manifest.js
  echo "修正: app/assets/config/manifest.js（builds の行を削除）"
fi

# 3. importmap をインストール（存在しなければ）
if [ ! -f config/importmap.rb ]; then
  echo "importmap が未インストールのため、インストールを実行します..."
  bin/rails importmap:install
fi

# 4. layout に javascript_importmap_tags を設定
LAYOUT_FILE="app/views/layouts/application.html.erb"
if grep -q "javascript_include_tag" "$LAYOUT_FILE"; then
  sed -i.bak 's/<%= javascript_include_tag.*%>/<%= javascript_importmap_tags %>/g' "$LAYOUT_FILE"
  echo "修正: javascript_include_tag を javascript_importmap_tags に置き換え"
fi

if ! grep -q "javascript_importmap_tags" "$LAYOUT_FILE"; then
  echo "警告: application.html.erb に javascript_importmap_tags が見つかりません。手動で追加してください。"
fi

echo "=== クリーンアップ完了！ ==="
echo "サーバーを再起動してください → bin/dev または bin/rails server"

