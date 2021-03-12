import axios from '../../plugins/axios.js';
import router from '../../router/router.js';
import message from './message';


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
        commit(`message/setContent`, {
          content: 'ログインしました',
          timeout: 6000
        }),
        router.push("/tasks")
      })
      .catch(err => console.log(err.response.data))
    },
    logoutUser({ commit }) {
      axios.delete(`/session`)
      .then(res => {
        commit('setUser', null)
      })
      .catch(err => console.log(err))
    },
    updateUser({ commit }, user){
      axios.patch('/profile', {user: user})
      .then(res => {
        commit('setUser', res.data)
      })
      .catch(err => console.log(err.response))
    }
  }
}