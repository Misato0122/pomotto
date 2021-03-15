<template>
  <div id="task-detail-modal">
    <div
      class="modal"
      @click.self="handleCloseModal"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
                <v-list-item two-line>
                  <v-list-item-content>
                    <v-list-item-subtitle>やること</v-list-item-subtitle>
                    <v-list-item-title>{{ task.title }}</v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
                <v-list-item two-line>
                  <v-list-item-content>
                    <v-list-item-subtitle>実行状況</v-list-item-subtitle>
                    <v-list-item-title>{{ task.status }}</v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
                <v-list-item two-line>
                  <v-list-item-content>
                    <v-list-item-subtitle>詳細</v-list-item-subtitle>
                    <v-list-item-title>{{ task.content }}</v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
                <TaskChart
                  v-if="loaded"
                  :labels="labels"
                  :datasets="datasets"
                />
            <div class="modal-footer">
              <v-btn
                @click="handleCloseModal"
                color="secondary"
              >
                閉じる
              </v-btn>
            </div>
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