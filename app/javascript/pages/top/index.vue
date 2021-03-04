<template>
  <div>
    <template v-if="!user">
    <p>トップページ</p>
    <router-link
      :to="{ name: 'RegisterPage' }"
      class="btn btn-primary mr-5"
    >
    ユーザー登録
    </router-link>
    </template>
    <template v-else>
      <p>ログイン後のページ</p>
      <router-link
        :to="{ name: 'TaskIndex' }"
        class="btn btn-primary mr-5"
      >
      タスクページ
      </router-link>
    </template>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  name: 'TopIndex',
  computed: {
    ...mapGetters("users", ["user"])
  }
}
</script>