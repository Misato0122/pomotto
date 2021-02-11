<template>
  <div id="app">
    <TheHeader />
    <div class="container">
      <router-view />
    </div>
    <TheFooter />
  </div>
</template>

<script>
import TheHeader from './components/TheHeader';
import TheFooter from './components/TheFooter';
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
