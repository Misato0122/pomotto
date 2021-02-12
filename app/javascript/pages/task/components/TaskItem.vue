<template>
  <div>
    <div class="card my-3 p-10">
      <div class="card-body">
        <span>
        <input type="checkbox" v-model="task.status" true-value="done" false-value="todo" @change="changeTaskStatus">
        {{ task.status }}
        <h5 class="card-title">{{ task.title }}</h5>
        <p class="card-text">{{ task.deadline }}
          <button class="btn btn-secondary" @click="handleOpenPomodoroTimer">スタート</button>
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
    handleOpenPomodoroTimer() {
      this.$emit('handleOpenPomodoroTimer')
    },
    changeTaskStatus() {
      // タスクを更新するAPIを叩く処理
    }
  }
}
</script>