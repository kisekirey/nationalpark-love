#!/bin/bash
# ============================================================
# NPJ画像ダウンロードスクリプト
# サーバーのルートディレクトリで実行してください
# ============================================================
# 使用方法:
#   chmod +x download-images.sh
#   ./download-images.sh
# ============================================================

set -e
mkdir -p images

echo "📥 Unsplash画像をダウンロード中..."

# ── ヒーロー画像（各ページ上部、1920px幅） ──
curl -L -o images/hero-top-fuji.jpg "https://images.unsplash.com/photo-1542640244-7e672d6cef4e?w=1920&q=80"
curl -L -o images/hero-chiiki-akan.jpg "https://images.unsplash.com/photo-1528164344705-47542687000d?w=1920&q=80"
curl -L -o images/hero-ritou-amami.jpg "https://images.unsplash.com/photo-1590523741831-ab7e8b8f9c7f?w=1920&q=80"
curl -L -o images/hero-yasei-wildlife.jpg "https://images.unsplash.com/photo-1474511320723-9a56873571b7?w=1920&q=80"
curl -L -o images/hero-dantai-nature.jpg "https://images.unsplash.com/photo-1480796927426-f609979314bd?w=1920&q=80"

# ── ピラーカード画像（トップページ3本柱、800px幅） ──
curl -L -o images/pillar-chiiki-akan.jpg "https://images.unsplash.com/photo-1528164344705-47542687000d?w=800&q=80"
curl -L -o images/pillar-ritou-amami.jpg "https://images.unsplash.com/photo-1590523741831-ab7e8b8f9c7f?w=800&q=80"
curl -L -o images/pillar-yasei-wildlife.jpg "https://images.unsplash.com/photo-1474511320723-9a56873571b7?w=800&q=80"

# ── その他セクション画像 ──
curl -L -o images/mission-nature.jpg "https://images.unsplash.com/photo-1480796927426-f609979314bd?w=1200&q=80"
curl -L -o images/project-kawayu-vc.jpg "https://images.unsplash.com/photo-1571863533956-01c88e79957e?w=1200&q=80"
curl -L -o images/project-yorojima.jpg "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&q=80"
curl -L -o images/project-oki-nishinoshima.jpg "https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=800&q=80"

echo ""
echo "📥 役員プロフィール写真をダウンロード中（nationalpark.love）..."

# ── 顧問・理事プロフィール写真（団体概要ページ） ──
curl -L -o images/profile-yamauchi.png "https://nationalpark.love/wp-content/uploads/2026/01/CleanShot-2026-01-21-at-10.31.35.png"
curl -L -o images/profile-ota.png "https://nationalpark.love/wp-content/uploads/2026/01/CleanShot-2026-01-21-at-10.32.39.png"
curl -L -o images/profile-goto.png "https://nationalpark.love/wp-content/uploads/2026/01/CleanShot-2026-01-21-at-10.31.44.png"
curl -L -o images/profile-harris.png "https://nationalpark.love/wp-content/uploads/2026/01/CleanShot-2026-01-21-at-10.31.55.png"
curl -L -o images/profile-fujita.png "https://nationalpark.love/wp-content/uploads/2026/01/CleanShot-2026-01-21-at-11.43.02.png"
curl -L -o images/profile-yamazaki.png "https://nationalpark.love/wp-content/uploads/2026/01/CleanShot-2026-01-21-at-10.33.04.png"

echo ""
echo "✅ 全18画像のダウンロード完了"
echo ""
echo "ディレクトリ構成:"
ls -la images/
