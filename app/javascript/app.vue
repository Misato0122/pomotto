<template>
  <div id="app">
    <TheHeader />
    <router-view />
    <TheFooter />
  </div>
</template>

<script>
import TheHeader from './conponents/TheHeader.vue'
import TheFooter from './conponents/TheFooter.vue'
export default {
  components: {
    TheHeader,
    TheFooter
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
