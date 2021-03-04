<template>
  <div>
    <div class="card my-3 p-10">
      <div class="card-body">
        <span>
        <input type="checkbox" v-model="task.status" true-value="done" false-value="todo" @change="changeTaskStatus(task)">
        {{ task.status }}
        <h5 class="card-title">{{ task.title }}</h5>
        <p class="card-text">{{ task.deadline }}
          <button class="btn btn-primary" @click="handleOpenDetailTaskModal(task)">詳細</button>
          <slot name="start-button">
          </slot>
          <button class="btn btn-secondary" v-if="task.status == 'todo'" @click="handleOpenEditTaskModal(task)">編集</button>
          <button class="btn btn-danger" @click="handleDeleteTask(task)">削除</button>
        </p>
        </span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'TaskItem',
  data() {
    return {
      visiblePomodoroStartButton: true
    }
  },
  props: {
    task: {
      type: Object,
      required: true
    }
  },
  methods: {
    changeTaskStatus(task) {
      this.$emit('changeTaskStatus', this.task)
    },
    handleDeleteTask(task) {
      this.$emit('deleteTask', this.task)
    },
    handleOpenEditTaskModal(task) {
      this.$emit('handleOpenTaskEditModal', this.task)
    },
    handleOpenDetailTaskModal(task) {
      this.$emit('handleOpenDetailTask', this.task)
    },
  }
}
</script>

