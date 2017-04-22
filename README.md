# autoZaimInputter
ZaimAPIを用いて、収入/支出の自動入力を行うCUIツール

静的に作成した、登録用のテンプレートに基いて登録作業を行うため、毎月の固定収支を登録しておき、cronで自動実行することを想定している

# 前提
以下のシステム構成で動作を確認
|要素|バージョン|
|----|---------|
|debian|8.6|
|ruby|2.2.2|
|gem|2.4.5|
|bundle|1.1.3|
また、ZaimAPI用のアクセスキー及びアクセストークンを取得済みであること

# セットアップ
本リポジトリをクローン
```bash
git clone git@github.com:Sa2Knight/autoZaimInputter.git
```
プロジェクトルートに、ZaimAPI用のアクセスキー及びアクセストークンをJSONで記載した、secret.jsonを作成する。以下はsecret.jsonの例
```json
{
    "key":"hoge",
    "secret":"fuga",
    "access_token":"foo",
    "access_token_secret":"bar"
}
```
プロジェクトルートに、自動登録する収支の内容をJSONで記載した、template.jsonを作成する。以下はtemplate.jsonの例
```json
{
  "income": [
    {
      "category_id": 11,
      "amount": 200000,
      "place": "会社",
      "comment": "給料"
    }
  ],
  "payment": [
    {
      "category_id": 106,
      "genre_id": 10601,
      "amount": 50000,
      "place": "不動産",
      "comment": "家賃"
    },
    {
      "category_id": 108,
      "genre_id": 10803,
      "amount": 540,
      "place": "ニコニコ動画",
      "comment": "プレミアム会員料金"
    },
    {
      "category_id": 104,
      "genre_id": 10403,
      "amount": 972,
      "place": "さくらインターネット",
      "comment": "Redmine用VPS"
    }
  ]
}
```
実行方法
```bash
bundle exec ruby main.rb
```
