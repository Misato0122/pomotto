export default {
  namespaced: true,

  state: {
    content: ''
  },

  mutations: {
    setContent (state, { content, timeout }) {
      state.content = content

      if(typeof timeout === 'undefined') {
        timeout = 3000
      }

      setTimeout(() => (state.content = ''), timeout)
    }
  }
}