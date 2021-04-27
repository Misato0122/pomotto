## ポモドーロ統計xTodoアプリを掛け合わせた時間管理アプリ「pomotto」

# [pomotto](https://pomotto12345.herokuapp.com/)


## サービス概要
学習や作業の集中力が続かない人に集中力を持続・向上を狙うアプリです。
Todoリストのタスクにポモドーロ・テクニックを付け、統計を自動的に記録できるアプリケーションです。
１日のポモドーロ回数を記録して日々の学習・作業時間の推移を記録し達成感を感じ、集中力を持続させることが狙いです。

ポモドーロテクニックについては[こちら](https://www.newsweekjapan.jp/stories/carrier/2019/03/post-11867.php)の記事をご覧ください


## 使用画面
|タスク作成ボタンからタスク作成|実行ボタンを押すとタイマーモーダル表示|
|---|---|
|<img src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/638638/ae2b7301-3349-279a-4103-01424c89f20a.png">|<img src="https://i.gyazo.com/24d9200b0684b700f811c0b192223d78.png">|

|タイマーが完了したら音が鳴り、完了ボタン表示|完了ボタンを押すと休憩タイマーがスタートする|
|---|---|
|<img src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/638638/dba9ff7a-70f4-06a4-6299-eb362a0cc16c.png">|<img src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/638638/4d28f96d-fcf9-f1f4-35f3-c6d894b32596.png">|

|プロフィールページで一週間の作業時間を確認できます|タスクにかけた作業時間も確認できます|
|---|---|
|<img src="https://i.gyazo.com/35be05448cc31fb5c546e0de67b67c54.png">|<img src="https://i.gyazo.com/405f5f10ce851ce1161193176008c294.png">|


## pomottoを作るにあたっての背景

### 登場人物
* 自宅でプログラミングや資格勉強などを学習されている方
* リモートワークなどで長時間家で作業する方

### ユーザーが抱える問題
自宅で長時間学習を続けていると飽きがきてしまってモチベーションが下がる。
少し休憩するつもりがいつの間にか1時間、2時間が過ぎていたりすることがある。

### 解決方法
ポモドーロ・テクニックを用いて作業時間にメリハリを付けて作業効率を上げる。
１日のポモドーロの統計を自動的に記録し1週間や1ヶ月ごとに推移をグラフで表すことで長時間やり切った達成感を与える。
あまり集中出来ていない時期をグラフでわかりやすく発見でき、追い込みをかけるきっかけを作ることができる。

### プロダクト
ポモドーロ・タイマーの統計とTodoリストを掛け合わせた学習や作業のモチベーションを上げるアプリケーション。

### マーケット
自宅や一人で長時間の学習・作業をする方


# 使用技術
- rails `6.0.3`
- ruby `2.7.2`
- Vue.js
- vuetify
- bootstrapvue
- axios(API)
- Vuex
- Vee-validate
- Vue-router
- Firebase storage(音楽ファイル管理)

## 主要gem
- sorcery(ログイン認証)
- vue-cahrtkick(グラフ)
- rspec-rails(テスト)
- meta-tags(メタタグ)



## 関連記事
[【個人開発】ポモドーロテクニックとTodoリストを組み合わせた時間管理アプリを作りました](https://qiita.com/Misato0122/items/aad6f79c2763b8eee6e3)

[ポートフォリオをデプロイするまでの反省点](https://miiina01220.hatenablog.com/entry/2021/04/27/115252)
