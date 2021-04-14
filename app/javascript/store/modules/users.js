import axios from '../../plugins/axios.js';
import router from '../../router/router.js';

export default {
  namespaced: true,
  state: {
    user: null
  },
  getters: {
    user: state => state.user
  },
  mutations: {
    setUser(state, user) {
      state.user = user
    },
  },
  actions: {
    async fetchLoginUser({ commit, state }) {
      if(state.user) return state.user

      const userResponse = await axios.get('/profile')
      .catch((err) => {
        return null
      })
      if(!userResponse) return null

      const loginUser = userResponse.data
      if(loginUser) {
        commit('setUser', loginUser)
        return loginUser
      } else {
        commit('setUser', null)
        return null
      }
    },
    loginUser({ commit }, user) {
      axios.post("/session", user)
      .then(res => {
        commit('setUser', res.data),
        router.push("/tasks")
      })
      .catch(err => console.log(err.response.data))
    },
    logoutUser({ commit }) {
      axios.delete(`/session`)
      commit('setUser', null)
    },
    updateUser({ commit }, user){
      axios.patch('/profile', {user: user})
      .then(res => {
        commit('setUser', res.data)
      })
      .catch(err => console.log(err.response))
    },
    deleteUser({ commit }, user){
      axios.delete(`/users/${user.id}`, user)
      .then(res => {
        commit('setUser', null)
        router.push("/")
      })
      .catch(err => console.log(err.response))
    },
    guestLogin({ commit }) {
      axios.post('/session/guest_login')
      .then(res => {
        commit('setUser', res.data)
        router.push("/tasks")
      })
      .catch(err => {
        console.log(err.response.data)
      })
    }
  }
}