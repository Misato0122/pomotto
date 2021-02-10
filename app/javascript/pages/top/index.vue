<template>
  <div>
    <p>トップページ</p>
    <router-link
      :to="{ name: 'TaskIndex' }"
    >
    はじめる
    </router-link>
  </div>
</template>

<script>
export default {
  name: 'TopIndex'
}
</script>