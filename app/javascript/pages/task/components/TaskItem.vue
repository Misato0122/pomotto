<template>
  <div>
    <div class="card my-3 p-10">
      <div class="card-body">
        <span>
        <input type="checkbox" v-model="task.status" true-value="done" false-value="todo" @change="changeTaskStatus(task)">
        {{ task.status }}
        <h5 class="card-title">{{ task.title }}</h5>
        <p class="card-text">{{ task.deadline }}
          <button class="btn btn-secondary" v-if="task.status == 'todo'" @click="handleOpenPomodoroTimer(task)">スタート</button>
          <router-link
            :to="{ name: 'TaskDetail'}"
          >
            タスク詳細
          </router-link>
        </p>
        </span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'TaskItem',
  props: {
    task: {
      type: Object,
      required: true
    }
  },
  methods: {
    handleOpenPomodoroTimer(task) {
      this.$emit('handleOpenPomodoroTimer', this.task)
    },
    changeTaskStatus(task) {
      this.$emit('changeTaskStatus', this.task)
    }
  }
}
</script>