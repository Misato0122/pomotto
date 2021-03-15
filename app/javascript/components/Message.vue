<template>
  <v-alert 
  type="info"
  v-if="message !== ''"
  >
  {{ message }}
  </v-alert>
</template>

<script>
import { mapState } from 'vuex';
export default {
  computed: {
    ...mapState({
      massage: state => state.message.content
    })
  }
}
</script>