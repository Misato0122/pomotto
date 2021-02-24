<template>
  <div>
    <h1>プロフィールページ</h1>
    <p>{{user.name}}</p>
    <p>{{user.email}}</p>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  name: 'ProfilePage',
  computed: {
    ...mapGetters("users", ["user"])
  },
  created() {
    this.fetchUser()
  },
  methods: {
    ...mapActions("users", ["fetchUser"])
  }
}
</script>