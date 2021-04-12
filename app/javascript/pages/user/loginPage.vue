<template>
  <div>
  <p v-if="$route.query.redirect">
    ログインしてください
  </p>
    <v-card width="500px" class="mx-auto mt-5">
      <v-card-title>
        <h1 class="display-1">ログインページ</h1>
      </v-card-title>
      <v-card-text>
        <validation-observer
          ref="obserber"
          v-slot="{ invalid }"
        >
          <v-form @submit.prevent="submit">
            <validation-provider
              v-slot="{ errors }"
              name="メールアドレス"
              rules="required|email"
            >
              <v-text-field
                prepend-icon="mdi-email"
                v-model="user.email"
                label="メールアドレス"
                required
              >
              </v-text-field>
              <span class="text-danger">{{ errors[0] }}</span>
            </validation-provider>
            <validation-provider
              v-slot="{ errors }"
              name="パスワード"
              rules="required"
            >
              <v-text-field
                prepend-icon="mdi-key-variant"
                v-model="user.password"
                label="パスワード"
                required
              >
              </v-text-field>
              <span class="text-danger">{{ errors[0] }}</span>
            </validation-provider>
            <br>
            <v-btn
            block
            color="success"
            class="mr-4"
            @click="loginUser(user)"
            type="submit"
            :disabled="invalid"
            >
              ログイン
            </v-btn>
          </v-form>
        </validation-observer>
        <router-link
          :to="{ name: 'RegisterPage' }"
          class="d-flex align-items-center justify-content-center"
        >
          ユーザー登録はこちら
        </router-link>
        <hr>
          <br>
          <v-btn
          @click="guestLogin"
          block
          color="blue"
          class="d-flex align-items-center justify-content-center"
          >
          ゲストログイン
          </v-btn>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
import { mapActions } from 'vuex';
export default {
  name: "LoginPage",
  data(){
    return {
      user: {
        email: "",
        password: ""
      }
    }
  },
  methods: {
    ...mapActions("users", ["loginUser", "guestLogin"]),
    submit() {
      this.$refs.observer.validate();
    },
  }
}
</script>

<style scoped>

</style>