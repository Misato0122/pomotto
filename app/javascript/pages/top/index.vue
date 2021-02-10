<template>
  <div>
    <p>トップページ</p>
    <router-link
      :to="{ name: 'TaskIndex' }"
      class="btn btn-primary mr-5"
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