<template>
  <div>
    <br><br>
    <div style="text-align: center;">
      <h1>Pomottoで</h1>
      <h1>作業効率向上を目指す</h1>
      <h3>Todoリスト×ポモドーロタイマーを組み合わせた作業効率推進アプリ</h3>
      <br>
      <template v-if="!user">
      <v-btn
        @click="toRegisterPage"
        color="#ff7171"
        x-large
      >
        はじめる
      </v-btn>
      </template>
      <template v-else>
        <v-btn
          @click="toTaskPage"
          color="#ff7171"
          x-large
        >
        はじめる
        </v-btn>
      </template>
      <img :src="background_image_src" height="500px" width="1200px">
    </div>
    <br>
    <h2 style="text-align: center">つかいかた</h2>
    <br><br>
    <div class="row flex-row">
      <div class="align-self-center col-md-5 col" style="text-align: center;">
        <img :src="pc_image_src" width="300px">
      </div>
      <div class="align-self-center col-md-7 col">
        <h5 class="mb-5">タスクを登録して、ポモドーロタイマーをスタート</h5>
        <br>
        <p>タスク内容と締め切り日を入力してタスクを登録します。</p>
        <p>タスクを登録したら、再生▶︎ボタンを押して25分間作業に集中します。</p>
      </div>
    </div>
    <br><br>
    <div class="row flex-row">
      <div class="align-self-center col-md-5 col" style="text-align: center;">
        <img :src="megaphone_image_src" width="300px">
      </div>
      <div class="align-self-center col-md-7 col">
        <h5 class="mb-5">タイマーが完了したら音でお知らせ</h5>
        <br>
        <p>25分タイマーが終わると音でお知らせします。</p>
        <p>完了ボタンを押すとポモドーロ回数がカウントされます！</p>
        <p>その後５分間の休憩タイマーが始まります。</p>
        <p>5分間休憩してから再度タイマーをスタートさせましょう。</p>
      </div>
    </div>
    <br><br>
    <div class="row flex-row">
      <div class="align-self-center col-md-5 col" style="text-align: center;">
        <img :src="bar_graph_image_src" width="300px">
      </div>
      <div class="align-self-center col-md-7 col">
        <h5 class="mb-5">作業時間をグラフで表示</h5>
        <br>
        <p>作業時間は自動的に記録される仕組みになっています。</p>
        <p>マイページをみて今日どれくらい作業できたか確認しましょう。</p>
        <p>タスクごとの作業時間も詳細画面から確認することができます。</p>
        <small>※現在一週間の作業時間を確認することができます。</small>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  name: 'TopIndex',
  data() {
    return {
      background_image_src: require("../../../assets/images/背景画像.png"),
      pc_image_src: require("../../../assets/images/パソコンとトマト.png"),
      megaphone_image_src: require("../../../assets/images/メガホン.png"),
      bar_graph_image_src: require("../../../assets/images/棒グラフ.png")
    }
  },
  computed: {
    ...mapGetters("users", ["user"])
  },
  methods: {
    toRegisterPage() {
      this.$router.push({ name: "RegisterPage" })
    },
    toTaskPage() {
      this.$router.push({ name: "TaskIndex" })
    }
  }
}
</script>

<style scoped>
  .row {
    border-radius: 10px;
    background-color: #e4fbff;
  }
  h1, h2, h5 {
    font-weight:bold;
  }
</style>