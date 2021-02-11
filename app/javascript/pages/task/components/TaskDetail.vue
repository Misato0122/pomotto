<template>
  <div>
    <p>タスク詳細ページ</p>
    <router-link
      :to="{ name: 'TaskIndex' }"
    >
    タスク一覧に戻る
    </router-link>
  </div>
</template>

<script>
export default {
  name: "TaskDetail"
}
</script>