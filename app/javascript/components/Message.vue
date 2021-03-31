<template>
<v-alert type="info" v-show="message">
  {{ message }}
</v-alert>
</template>

<script>
import { mapState } from 'vuex';
export default {
  computed: {
    ...mapState({
      message: state => state.message.content
    })
  }
}
</script>