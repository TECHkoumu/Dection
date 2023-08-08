# アプリケーション名
Dection  

# アプリケーション概要
ユーザーの自発的な行動をサポートするアプリケーション  

# URL
デプロイ後記載予定  

# テスト用アカウント
・メールアドレス：usagi@gmail.com  
・パスワード：us0808  

# 利用方法
1.トップページのヘッダーからユーザー新規登録を行います。  
2.「今の気持ちを書いてみる」ボタンから、起こった事実の概要、具体的な内容、その事実が「悪いあの人orかわいそうな私」のどちらに属するか選択、起こった事実の辛さに点数をつけます  
3.「これからどうするかを決める▶︎」ボタンから、これからどうするかをテーマに箇条書きを行います。  
4.箇条書きを参考に行動指標を決めます。  
5.トップページの「現在の行動指標」から設定した指標を確認し、その日その指標に対して適切な行動がどのくらいできたか点数をつけます。また、必要に応じてコメントに記入します。
6.適切な行動の累積点が2で決めた辛さの点数を超えたらクリアとなり、トップページの「〇〇さんが乗り越えてきたもの」に歴史として残ります。

# 洗い出した要件
要件定義シートのURL

# 作成した背景
このアプリケーションを作成した背景は、不安に押しつぶされそうな人に「これからどうするか」を考え行動に移すことを促せればと考えたからです。  
私は同僚や仲間の相談に乗る機会が多く、その度に「A4用紙に今の気持ちを書く。裏にこれからどうするかを書く。行動に移し継続する。」ということを伝えています。  
これは「嫌われる勇気」と「幸せになる勇気」という本を読み、その内容から得た知見を私が５年以上実践して効果があると感じるためです。  
私はこの方法で、自分で自分を支援することができ、人生の課題をシンプルに考えられるようになりました。  
しかし多くの相談に乗る中で私が直面したのは、悩んでいる人にとってA4用紙とペンを用意することや書くことは、手間に感じるということでした。  
そこで私は「スマホやPCで利用できればとっつきやすいのではないか」「アプリであればより多くの人に普及できるのではないか」と考え、自身のメモ書きを参考に、一定の様式をWebアプリケーションとして提供することとしました。  


# 実装予定の機能
現在、行動指標入力機能を実装中
今後は、点数の加算と歴史への掲載を実装予定

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/fcd3f25b7bc5713afd13d1f7195212a2.png)](https://gyazo.com/fcd3f25b7bc5713afd13d1f7195212a2)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/11c5c6b88b7761d5ada0395ab6d2e845.png)](https://gyazo.com/11c5c6b88b7761d5ada0395ab6d2e845)

# 開発環境
・フロントエンド Ruby on Rails
・バックエンド Ruby on Rails
・インフラ Render
・テキストエディタ VScode

# 工夫したポイント
コンセプトの差別化を工夫しました。  
他の受講生が競合相手だったらと仮定し、どのような差別化を実現するのが良いか考えました。他者と共有することをベースにしたアプリを作成する方が多かったので、逆の発想で自身と向き合うことをコンセプトにしたアプリケーションを開発することとしました。市場はメンタルクリニック等の医療関係、コーチング分野を想定しています。







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


