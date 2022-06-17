![first_todo](app/assets/images/logo.png) 
<br><br>

# 1.アプリケーションの概要
<br>

## アプリケーション名
### 「First To Do」
<br>

## 概要
毎日忙しくてスケジュール管理が疎かになっている。<br>
業務に追われて仲間と密にコミュニケーションが取れていない。<br>
そんな頑張っているあなたの一歩を後押しすることを目的としたToDoアプリケーションです。<br>
個人のToDoはもちろん、担当部門やスポーツチームなど、用途に合わせて様々なグループ単位でのToDoも画像付きで管理できます。<br>

## URL（Herokuによるデプロイ）
https://first-todo322.herokuapp.com/

### Basic認証
- ID: ryosasaki
- Pass: 0322

<br>

### テスト用アカウント①
- ニックネーム: hoge
- メールアドレス: hoge@hoge
- パスワード: a11111

### テスト用アカウント②
- ニックネーム: fuga
- メールアドレス: fuga@fuga
- パスワード: b22222

<br>

### 利用方法
1. ログイン後、ユーザー別の個人ToDoページに遷移し、個人別のToDo管理ができます。<br>
2. ページ内「ルームに移動する」をクリックすると、共有ToDoの作成ページに遷移し、新規ToDoルーム作成、ルーム検索などができます。<br>
ルーム毎に任意のパスワードを設定することで、参加メンバーの制限が可能です。
3. ルーム内では、投稿されたタスク毎にコメントの投稿ができ、タスクについてコミュニケーションを図れます。<br>

是非、利用してみてください！
<br>
<br>
<br>

# 2.アプリ作成の背景
前職在職中、複数の同僚と抱えていた課題が「店舗、担当部門でタスクを共有できない」、「変則的なシフトのため、業務の進捗や技術的なコミュニケーションに限界がある」という課題であった。<br>
課題を分析した結果、「変則的なシフトのため、全員と顔を合わせることは難しく、コミュニケーションに限界がある」、「タスクは口頭や書面でのやり取りしか方法がなく、対応しきれていない」、「LINEなどのツールはプライベート色が強く、業務連絡には抵抗がある」ということが真因であると仮説を立てた。<br>
同様の課題を抱えている方も多いと推測し、真因を解決するために、任意のグループ毎にタスクを共有し、タスク毎にコミュニケーションを促進できるToDoアプリケーションを開発することにした。
<br>
<br>

# 3.要件定義
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1XvlCMMg2rXPmadto9oi6pt4vYb6Cd2uKLyNJetyT9xI/edit#gid=982722306)
<br>
<br>

# 4.実装機能についての説明

| No | 実装機能          | 説明                    | 画像                   |
| -- | ---------------- | -----------------------| --------------------- |
| 1  | ランディングページ  | アプリケーションの機能紹介  | <img src="https://i.gyazo.com/1d7a0adb65ab220a03165886ca6b7651.gif" width="240" height="170"> |
| 2  | ユーザー管理       | ユーザー別の機能とするため  | <img src="https://i.gyazo.com/de1d12ee2e0bd59f421ab0544d50e0fa.gif" width="240" height="170"> |
| 3  | My ToDo          | ユーザー個別のToDo管理機能 | <img src="https://i.gyazo.com/e459ace3ae225ea8946b5a194dd0cd9a.gif" width="240" height="170"> |
| 4  | 画像投稿          | ToDoには画像が投稿できる   | <img src="https://i.gyazo.com/354396a4a63b82db39b235f942713fd8.gif" width="240" height="170"> |
| 5  | ルーム作成        | 各ユーザーはToDoルームを<br>パスワード付きで作成することができる | <img src="https://i.gyazo.com/aaaddfa7a36aa91d4b0b169aeaa15a47.gif" width="240" height="170"> |
| 6  | ルーム検索        | ToDoルーム一覧から参加するルームを<br>検索することができる | <img src="https://i.gyazo.com/6f81370eccfa4e9d09d83aa95a52c0c8.gif" width="240" height="170"> | |
| 7  | コメント投稿      | 各ルームではタスク毎にコメントが<br>投稿できる          | <img src="https://i.gyazo.com/16e057e3f07cd27e1dea29a5704a5de8.gif" width="240" height="170"> |
| 8  | スマートフォン対応 | スマートフォンでも快適な操作が可能 | <img src="https://i.gyazo.com/7ede03046b264e18d9cc3dc2b818aefc.gif" width="110" height="170"> |

<br>

# 5.実装予定の機能
- 複数枚の画像投稿機能
- ルームページまでの遷移を簡素化
<br>
<br>

# 6.データベース設計
<img src="https://i.gyazo.com/099e5bba7822987911c53494deb27c62.png" width="600" height="500">

<br>

## テーブル設計


## users テーブル

| Column                       | Type    | Options                   |
| ---------------------------- | ------- | ------------------------- |
| nickname                     | string  | null: false               |
| email                        | string  | null: false, unique: true |
| encrypted_password           | string  | null: false               |
| first_name                   | string  | null: true                |
| last_name                    | string  | null: true                |
| department                   | string  | null: true                |
| position                     | string  | null: true                |

### Association

- has_many :rooms
- has_many :mylists
- has_many :grouplists
- has_many :comments


## mylists テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| title                        | string     | null: false                    |
| start_time                   | datetime   | null: false                    |
| text                         | string     | null: true                     |
| user_id                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image


## rooms テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| password_digest  | string     | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :grouplists


## grouplists テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| title                        | string     | null: false                    |
| start_time                   | datetime   | null: false                    |
| text                         | string     | null: true                     |
| user_id                      | references | null: false, foreign_key: true |
| room_id                      | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- belongs_to :room
- has_one_attached :image


## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| grouplist_id  | references | null: false, foreign_key: true |
| room_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :grouplist
- belongs_to :room

<br>

## 画面遷移図
<img src="https://i.gyazo.com/6ec1a91088f01b053a80e3bfb2c8d5a5.png" width="600" height="300">

<br>
<br>

# 7.開発環境
- フロントエンド<br>
HTML/CSS &emsp; JavaScript &emsp; jQuery
- バックエンド<br>
Rails6.0.0 &emsp; ruby 2.6.5 
- インフラ<br>
MySQL2 0.4.4
- テスト<br>
Rspec &emsp; Faker
- テキストエディタ<br>
Visual Studio Code 1.67.2
- その他使用技術<br>
devise &emsp; bcrypt &emsp; mini_magick &emsp; simple_calendar

<br>
<br>

# 8.ローカルでの動作方法
以下のコマンドを順に実行。<br>
% git clone https://github.com/sskryu322/first-todo.git
<br>
% cd first-todo
<br>
% bundle install
<br>
% yarn install
<br>
% rails db:create
<br>
% rails db:migrate

<br>
<br>

# 9.工夫したポイント
### 1.納得して利用してもらえるか
- ランディングページの設置により、アプリケーションの機能をあらかじめ説明することで、納得してユーザー登録してもらえるよう構成した。
- ユーザー登録により、パーソナルな環境を作れるよう構成した。
<br>

### 2.安心して利用してもらえるか
- 各ルームページにはパスワード設定によるログイン機能を設け、ルームへログインしたメンバーのみの空間を実現した。
<br>

### 3.利便性、操作性はユーザー視点か
- 各タスクはカレンダー表示とリスト表示、画像添付機能を設けることで、視覚的にスケジュール管理をしやすいよう構成した。
- PC、スマートフォンで、メイン機能のデザインを変更。特にスマートフォンでの利用頻度が高くなることを想定し、タスク投稿は画面遷移なしの構成した。


