# README


# SPA_PROJECT
温泉好きの方のためのアプリケーションです。
このアプリケーションでは下記のことが可能です。

---

## 機能

●会員登録機能
●温泉の投稿機能
●現在地から温泉を探す機能
●ランキングからおすすめの記事が見れる機能

---

## 使い方

1. トップページ(https://www.shun1125.site/) にアクセスしてください。ログインしていなくても記事を楽しめます。
2. ログインをすると自分で記事を投稿したり、現在地から3km以内のみんなが投稿した温泉が表示されます。
3. 投稿の際に住所を登録すると、記事の中に住所情報が登録されます。
4. 投稿したページではいいねをして後で読み返すことができたり、コメント機能からコミュニケーションをとることができます。

---

## 使用したGem

```
gem 'rubocop' #コード解析用　現状Warningコードの改善のみ
```
```
gem 'devise' #ログイン機能実装用
```
```
gem "geocoder" #住所から緯度経度に変換

gem "gmaps4rails" #グーグルマップを表示
```
```
gem 'jquery-rails' #jquery
```
```
gem 'bootstrap', '~> 4.1.1' #Bootstrap4
```
```
gem 'kaminari' #ページネーション実装
```
```
gem "refile", require: "refile/rails", github: 'manfe/refile' #画像投稿機能用
gem "refile-mini_magick" #画像サイズ調整用
```

---

## デプロイ

- Webサーバ
> AWS EC2 Apache(Passenger)
- データベース(本番環境用)
> MySQL
- ドメイン取得(DNS設定)
> お名前.com Route53
- 常時SSL化
> ACM(Amazon Certificate Manager)
- 冗長化対策
> ALB(Application Load Balancer) RDS

---


# 作者

[@ShunItsuki](https://twitter.com/ShunItsuki)
mail to: rtfqn935@yahoo.co.jp