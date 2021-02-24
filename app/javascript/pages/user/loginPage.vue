<template>
  <div>
  <b-card bg-variant="light">
    <h2>ログインページ</h2>
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
      <button
        class="btn btn-primary"
        @click="userLogin(user)"
      >
      ログイン
      </button>
  </b-card>
</div>
</template>

<script>
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
    userLogin(user) {
      this.$axios.post("/session", user)
      .then(res => {
        console.log(res.data),
        this.$router.push("/tasks")
      })
      .catch(err => console.log(err.status))
    }
  }
}
</script>

<style scoped>

</style>