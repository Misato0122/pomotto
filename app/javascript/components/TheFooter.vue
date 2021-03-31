<template>
  <v-footer app padless dark color="#4ca4b4">
    <v-col
    class="text-center"
    cols="12"
    >
    ©︎ 2021 Pomotto
    <router-link
    :to="{ name: 'TheTermPage' }"
    >
      利用規約
    </router-link>
    <router-link
    :to="{ name: 'ThePrivacyPolicyPage' }"
    >
    プライバシーポリシー
    </router-link>
    </v-col>
  </v-footer>
</template>

<script>
export default {
  name: 'TheFooter'
}
</script>

<style scoped>
</style>