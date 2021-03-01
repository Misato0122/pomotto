<template>
  <div>
    <b-card bg-variant="light">
        <h2>登録ページ</h2>
        <b-form-group
          label="名前:"
          label-for="name"
          label-cols-sm="3"
          label-align-sm="right"
        >
          <b-form-input 
          id="name"
          v-model="user.name"
          >
          </b-form-input>
        </b-form-group>

        <b-form-group
          label="メールアドレス:"
          label-for="email"
          label-cols-sm="3"
          label-align-sm="right"
        >
          <b-form-input 
          id="email"
          v-model="user.email"
          >
          </b-form-input>
        </b-form-group>

        <b-form-group
          label="パスワード:"
          label-for="password"
          label-cols-sm="3"
          label-align-sm="right"
        >
          <b-form-input 
          id="password"
          v-model="user.password"
          >
          </b-form-input>
        </b-form-group>

        <b-form-group
          label="パスワード確認:"
          label-for="password_confirmation"
          label-cols-sm="3"
          label-align-sm="right"
        >
          <b-form-input 
          id="password_confirmation"
          v-model="user.password_confirmation"
          >
          </b-form-input>
        </b-form-group>
        <button
          class="btn btn-secondary"
          @click="handleAddRegisterUser(user)"
        >
        登録
        </button>
    </b-card>
  </div>
</template>

<script>
import { mapActions } from 'vuex';
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
    registerUser(user) {
      console.log(user)
      this.$axios.post('/users', {user: user})
      .then(res => {
        console.log(res.data),
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
    }
  }
}
</script>