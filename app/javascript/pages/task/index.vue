<template>
  <div>
    <p>タスクページ</p>
    <router-link
      :to="{ name: 'TopIndex' }"
    >
    はじめる
    </router-link>
  </div>
</template>

<script>
export default {
  name: 'TaskIndex'
}
</script>