import axios from '../../plugins/axios.js';

export default {
  namespaced: true,
  state: {
    tasks: []
  },
  getters: {
    tasks: state => state.tasks
  },
  mutations: {
    setTasks(state, tasks) {
      state.tasks = tasks
    },
    addTasks(state, task) {
      state.tasks.push(task)
    },
    updateTask: (state, updateTask) => {
      const index = state.tasks.findIndex(task => {
        return task.id == updateTask.id
      })
      state.tasks.splice(index, 1, updateTask)
    },
    deleteTask: (state, deleteTask) => {
      state.tasks = state.tasks.filter(task => {
        return task.id != deleteTask.id
      })
    }
  },
  actions: {
    fetchTasks({ commit }) {
      axios.get("tasks")
      .then(res => {
        commit('setTasks', res.data)
      })
      .catch(err => console.log(err.response));
    },
    createTask({ commit }, task) {
      axios.post("tasks", task)
      .then(res => {
        commit("addTasks", res.data)
      })
      .catch(err => console.log(err.response));
    },
    updateTask({ commit}, task) {
      axios.patch(`tasks/${task.id}`, task)
      .then(res => {
        commit('updateTask', res.data)
      })
      .catch(err => console.log(err.response));
    },
    deleteTask({ commit }, task){
      axios.delete(`tasks/${task.id}`, task)
      .then(res => {
        commit('deleteTask', res.data)
      })
      .catch(err => console.log(err.response));
    },
  }
}