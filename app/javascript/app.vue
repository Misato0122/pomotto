<template>
  <div id="app">
    <v-app>
      <TheHeader />
      <div class="container">
        <Message />
        <router-view />
      </div>
      <TheFooter />
    </v-app>
  </div>
</template>

<script>
import TheHeader from './components/TheHeader';
import TheFooter from './components/TheFooter';
import Message from './components/Message';

export default {
  components: {
    TheHeader,
    TheFooter,
    Message
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
