<template>
  <div id="task-detail-modal">
    <div
      class="modal"
      @click.self="handleCloseModal"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            {{ task.status }}
            <br>
            {{ task.title}}
            <br>
            {{ task.content}}
            <br>
            {{ task.deadline}}
            <br>
            <TaskChart
              v-if="loaded"
              :labels="labels"
              :datasets="datasets"
            />
            <br>
            <button
              type="button"
              class="btn btn-secondary"
              @click="handleCloseModal"
            >
              閉じる
            </button>
          </div>
        </div>
      </div>
    </div>
    <div class="modal-backdrop show" />
  </div>
</template>

<script>
import TaskChart from './TaskChart.vue'
export default {
  name: "TaskDetailModal",
  data() {
    return {
    loaded: false
    }
  },
  props: {
    task: {
      type: Object,
      required: true
    }
  },
  components: {
    TaskChart
  },
  mounted() {
    this.$axios.get(`/tasks/${this.task.id}/pomodoro_count`)
    .then(res => {
      this.labels = res.data.map(pomodoros => pomodoros.day)
      this.datasets = res.data.map(pomodoros => pomodoros.count)
      this.loaded = true
    })
    .catch(err => console.log(err.response))
  },
  methods: {
    handleCloseModal() {
      this.$emit('close-modal')
    },
  }
}
</script>

<style scoped>
  .modal {
    display: block;
  } 
</style>