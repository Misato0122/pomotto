<template>
  <div>
    <div class="card my-3 p-10">
      <div class="card-body">
      {{ number }}
        <h5 class="card-title">タスクタイトル</h5>
        <p class="card-text">タスク締め切り日</p>
        <button class="btn btn-secondary">スタート</button>
        <router-link
          :to="{ name: 'TaskDetail'}"
        >
          タスク詳細
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'TaskItem',
  props: {
    number: {
      type: String,
      required: true
    }
  }
}
</script>