# 静的HTML デプロイガイド
## ナショナルパークスジャパン — nationalpark.love

---

## ファイル構成

```
nationalpark.love/
├── index.html                 ← トップページ
├── chiiki-kasseika.html       ← 地域活性化支援
├── ritou-shinkou.html         ← 離島振興支援
├── yasei-seibutsu.html        ← 野生生物保護
├── dantai-gaiyou.html         ← 団体概要
├── npj-style.css              ← 共通CSS（全ページで使用）
├── download-images.sh         ← 画像一括ダウンロードスクリプト
└── images/                    ← 画像フォルダ（要ダウンロード）
    ├── hero-top-fuji.jpg
    ├── hero-chiiki-akan.jpg
    ├── hero-ritou-amami.jpg
    ├── hero-yasei-wildlife.jpg
    ├── hero-dantai-nature.jpg
    ├── pillar-chiiki-akan.jpg
    ├── pillar-ritou-amami.jpg
    ├── pillar-yasei-wildlife.jpg
    ├── mission-nature.jpg
    ├── project-kawayu-vc.jpg
    ├── project-yorojima.jpg
    ├── project-oki-nishinoshima.jpg
    ├── profile-advisor-01.png
    ├── profile-advisor-02.jpg
    ├── profile-advisor-03.jpg
    ├── profile-director-01.jpg
    ├── profile-director-02.png
    └── profile-director-03.png
```

---

## デプロイ手順

### Step 1: ファイルをサーバーにアップロード

全HTMLファイルと `npj-style.css` をサーバーのドキュメントルートに配置します。

### Step 2: 画像をダウンロード

サーバー上で画像ダウンロードスクリプトを実行：

```bash
chmod +x download-images.sh
./download-images.sh
```

または手動でブラウザから各URLを開いて保存し、`images/` フォルダに配置してください。

### Step 3: ドメイン設定

DNSの nationalpark.love を自社サーバーのIPアドレスに向けます。

### Step 4: SSL証明書

Let's Encrypt等でHTTPS化：

```bash
certbot --nginx -d nationalpark.love
# または
certbot --apache -d nationalpark.love
```

---

## 画像差し替えガイド

画像を差し替える場合は、`images/` フォルダ内のファイルを同名で上書きするだけでOKです。

### 推奨画像サイズ

| 用途 | 推奨幅 | 備考 |
|---|---|---|
| ヒーロー画像 (`hero-*.jpg`) | 1920px以上 | 横長、高解像度 |
| ピラーカード (`pillar-*.jpg`) | 800px以上 | 縦長トリミング可 |
| プロジェクト (`project-*.jpg`) | 800〜1200px | 16:9推奨 |
| プロフィール (`profile-*.png/jpg`) | 460×460px | 正方形、円形トリミングあり |

### 現在の画像内容

| ファイル名 | 現在の内容 | 推奨差し替え先 |
|---|---|---|
| `hero-top-fuji.jpg` | 富士山の風景（Unsplash） | NPJ独自の国立公園代表写真 |
| `hero-chiiki-akan.jpg` | 阿寒摩周エリア（Unsplash） | 川湯VCまたは阿寒の実写真 |
| `hero-ritou-amami.jpg` | 奄美の海（Unsplash） | 与路島の実際の風景 |
| `hero-yasei-wildlife.jpg` | 野生動物イメージ（Unsplash） | アマミノクロウサギ等の実写真 |
| `hero-dantai-nature.jpg` | 日本の自然（Unsplash） | 活動風景やスタッフ写真 |
| `project-kawayu-vc.jpg` | カフェイメージ（Unsplash） | 川湯VCの実際の外観・内観 |
| `project-yorojima.jpg` | ビーチ（Unsplash） | 与路島の集落・海岸 |
| `project-oki-nishinoshima.jpg` | 風景（Unsplash） | 西ノ島の風景 |

---

## CSS カスタマイズ

`npj-style.css` 冒頭の `:root` でカラー変更が可能：

```css
--np-green: #1B4D3E;       /* メインカラー */
--np-green-light: #2A7D5F; /* アクセント緑 */
--np-gold: #C4A14A;        /* ゴールド */
```

---

## 注意事項

- **プロフィール写真**: `profile-*` ファイルは旧Wixサイトからの移行画像です。Wixの契約終了前にダウンロードスクリプトを実行してください。
- **プライバシーポリシー**: フッターの「プライバシーポリシー」リンクが `href="#"` のままです。ページ作成後にリンクを更新してください。
- **メール登録フォーム**: トップページのメール登録フォームはフロントのみ（バックエンド未実装）です。Mailchimp等と連携する場合はフォームのaction属性を設定してください。
- **Google Fonts**: 外部CDN（fonts.googleapis.com）から読み込んでいます。完全にオフラインで使う場合はフォントファイルのセルフホスティングが必要です。
