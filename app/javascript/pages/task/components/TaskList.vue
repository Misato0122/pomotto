<template>
  <div class="col-2 col-lg-12">
    <div 
      :id="taskListId"
      class="bg-light rounded shadow m-3 p-3"
    >
      <slot name="header">
        タスク区分
      </slot>
      <template v-for="task in tasks">
      <TaskItem 
      :key="task.id"
      :task="task"
      @handleOpenPomodoroTimer="handleOpenPomodoroTimer"
      @changeTaskStatus="changeTaskStatus"
      />
      </template>
    </div>
  </div>
</template>

<script>
import TaskItem from './TaskItem.vue'
export default {
  name: 'TaskList',
  props: {
    tasks: {
      type: Array,
      require: true
    },
    taskListId: {
      type: String,
      require: true
    }
  },
  data() {
    return {
    }
  },
  components: {
    TaskItem
  },
  methods: {
    handleOpenPomodoroTimer(task) {
      this.$emit('handleOpenPomodoroTimer', task);
    },
    changeTaskStatus(task) {
      this.$emit('changeTaskStatus', task)
    }
  }
}
</script>