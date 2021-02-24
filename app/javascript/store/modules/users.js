import axios from '../../plugins/axios.js';
import router from '../../router/router.js'

// application.erbのcsrf_meta_tagsから生成されたtokenをリクエストヘッダーに代入している。
axios.defaults.headers['X-CSRF-TOKEN'] = document.getElementsByName('csrf-token')[0].getAttribute('content');


export default {
  namespaced: true,
  state: {
    user: {}
  },
  getters: {
    user: state => state.user
  },
  mutations: {
    setUser(state, user) {
      state.user = user
    }
  },
  actions: {
    fetchUser({ commit }) {
      axios.get('/profile')
      .then(res => {
        commit('setUser', res.data)
      })
      .catch(err => console.log(err.response));
    },
    registerUser(user) {
      axios.post('/users', {user: user})
      .then(res => {
        console.log(res.data),
        router.push('/login')
      })
      .catch(err => console.log(err.status))
    },
    loginUser({ commit }, user) {
      axios.post("/session", user)
      .then(res => {
        commit('setUser', res.data),
        router.push("/tasks")
      })
      .catch(err => console.log(err.status))
    },
    logoutUser() {
      axios.delete(`/session`)
      .then(res => {
        router.push('/login')
      })
      .catch(err => console.log(err))
    }
  }
}