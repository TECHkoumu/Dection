# アプリケーション名
Dection  

# アプリケーション概要
このアプリケーションはユーザーの苦悩をユーザー自身の行動によって乗り越えることをサポートするアプリ  

# URL
デプロイ後記載予定  

# テスト用アカウント
・メールアドレス：usagi@gmail.com  
・パスワード：us0808  

# 利用方法
1.トップページのヘッダーからユーザー新規登録を行う  
2.「今の気持ちを書いてみる」ボタンから、起こった事実の概要、具体的な内容、その事実が「悪いあの人orかわいそうな私」のどちらに属するか選択、起こった事実の辛さに点数をつける  
3.「これからどうするかを決める▶︎」ボタンから、これからどうするかをテーマに箇条書きを行う。  
4.箇条書きを参考に行動指標を決める。  
5.トップページの「現在の行動指標」から設定した指標を確認し、その日その指標に対して適切な行動がどのくらいできたか点数をつける。また、できたことやできなかったことをコメントに記入する。
6.適切な行動の累積点が2で決めた辛さの点数を超えたらクリアとなり、トップページの「〇〇さんが乗り越えてきたもの」に歴史として残る。

# 洗い出した要件
要件定義シートのURL

# 実装予定の機能
現在、行動指標入力機能を実装中
今後は、点数の加算と歴史への掲載を実装予定

# データベース設計

# 画面遷移図

# テーブル設計

## usersテーブル

| Column             |  Type  |     Options |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |


## Association
- has_many :emotions
- has_many :action_plans
- has_many :histories
- has_many :comments

## ユニーク制約の追加
`users`テーブルの`email`カラムにユニーク制約を追加する方法
1. マイグレーションファイルを作成
   ```ruby
   class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[6.1]
     def change
       add_index :users, :email, unique: true
     end
   end

2.マイグレーション実行
% rails db:migrate

3.rails test

## emotionsテーブル

| Column     | Type       | Options    |
| ---------- | ---------- | ---------- |
| event_occurred |   string   | null: false|
| specific_details |    text    | null: false|
| unpleasant_index | integer | null: false, limit: 1..100|
| category_id |integer | null: false, default: 0 |
| user_id    | references | null: false,foreign_key: true|

## Association
- belongs_to :user
- has_one :action
- belongs_to :history

## actionsテーブル

| Column     | Type       | Options    |
| ---------- | ---------- | ---------- |
| plan_example | text | null: false|
| plan | string | null: false|
| target_score | integer | null: false|
| current_score |integer | null: false|
| total_score |integer | |
| user_id    | references | null: false,foreign_key: true|
| emotion_id    | references | null: false,foreign_key: true|
## Association
- belongs_to :user
- belongs_to :emotion
- has_many :comments
- belongs_to :history

## historiesテーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| emotion_id | references | null: false, foreign_key:true |
| action_plan_id | references | null: false, foreign_key:true |
| user_id      | references | null: false, foreign_key:true |
## Association
- belongs_to :user
- has_many :emotions
- has_many :action_plans



## commentsテーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| content      | text       | null: false                   |
| action_plan_id | references | null: false, foreign_key:true |
| user_id      | references | null: false, foreign_key:true |


## Association

- belong_to :user
- belong_to :action_plan