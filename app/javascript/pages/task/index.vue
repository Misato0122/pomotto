<template>
  <div>
    <p>タスクページだよ</p>
    <router-link
      :to="{ name: 'TopIndex'}"
      class="btn btn-dark mt-5"
    >
    戻る
    </router-link>
  </div>
</template>

<script>
export default {
  name: "TaskIndex"
}
</script>