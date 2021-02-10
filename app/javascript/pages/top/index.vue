<template>
  <div>
    <p>トップページだよ</p>
    <router-link 
    :to="{ name: 'TaskIndex' }"
    class="btn btn-dark mt-5"
    >はじめる
    </router-link>
  </div>
</template>

<script>
export default {
  name: 'TopIndex'
}
</script>