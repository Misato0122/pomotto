<template>
  <div>
      <v-card width="500px" class="mx-auto mt-5">
        <v-card-title>
          <h1 class="display-1">サインアップ</h1>
        </v-card-title>
        <v-card-text>
          <validation-observer
            ref="observer"
            v-slot="{ invalid }"
          >
            <v-form @submit.prevent="submit">
              <validation-provider
                v-slot="{ errors }"
                name="ユーザー名"
                rules="required"
              >
                <v-text-field 
                prepend-icon="mdi-account"
                v-model="user.name"
                label="ユーザー名"
                required
                ></v-text-field>
                <span class="text-danger">{{ errors[0] }}</span>
              </validation-provider>
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
                ></v-text-field>
              <span class="text-danger">{{ errors[0] }}</span>
              </validation-provider>
              <validation-provider
                v-slot="{ errors }"
                name="パスワード"
                rules="required|min:5"
                vid="password"
              >
                <v-text-field 
                prepend-icon="mdi-key-variant"
                v-model="user.password"
                label="パスワード"
                required
                ></v-text-field>
              <span class="text-danger">{{ errors[0] }}</span>
              </validation-provider>
              <validation-provider
                v-slot="{ errors }"
                name="パスワード確認"
                rules="required|min:5|password_confirmed:@password"
              >
                <v-text-field 
                prepend-icon="mdi-key-variant"
                v-model="user.password_confirmation"
                label="パスワード確認"
                required
                ></v-text-field>
              <span class="text-danger">{{ errors[0] }}</span>
              </validation-provider>
              <br>
              <v-btn
              block
              color="success"
              class="mr-4"
              @click="handleAddRegisterUser(user)"
              type="submit"
              :disabled="invalid"
              >
              ユーザー登録
              </v-btn>
            </v-form>
          </validation-observer>
          <router-link
            :to="{ name: 'LoginPage' }"
            class="d-flex align-items-center justify-content-center"
          >
            ユーザーログインはこちら
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
import { mapMutations, mapActions } from 'vuex';

export default {
  name: "RegisterPage",
  data() {
    return {
      user: {
        name: "",
        email: "",
        password: "",
        password_confirmation: ""
      }
    }
  },
  methods: {
    ...mapActions("users", ["guestLogin"]),
    registerUser(user) {
      this.$axios.post('/users', {user: user})
      .then(res => {
        this.$store.commit(`message/setContent`, {
          content: 'ログインをお願いします',
          timeout: 6000
        }),
        this.$router.push('/login')
      })
      .catch(err => console.log(err.status))
    },
    async handleAddRegisterUser(user) {
      try{
        await this.registerUser(user)
      } catch(err) {
        console.log(err)
      }
    },
    submit() {
      this.$refs.observer.validate()
    },
  }
}
</script>