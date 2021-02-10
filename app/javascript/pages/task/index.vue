<template>
  <div>
    <p>タスクページ</p>
    <router-link
      :to="{ name: 'TopIndex' }"
      class="btn btn-primary mr-5"
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