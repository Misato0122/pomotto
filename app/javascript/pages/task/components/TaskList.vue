<template>
  <div class="col-md-12 col-md-8 col-sm-12 col-xs-10">
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
      @handleOpenTaskEditModal="handleOpenTaskEditModal"
      @deleteTask="deleteTask"
      @changeTaskStatus="changeTaskStatus"
      @handleOpenDetailTask="handleOpenDetailTask"
      >
        <template #start-button>
          <v-btn
            @click="handleOpenPomodoroTimer(task)"
            v-if="task.status == 'todo' && visiblePomodoroStartButton"
            fab
            color="#f25287"
          >
            <v-icon dark>
              mdi-play
            </v-icon>
          </v-btn>
        </template>
      </TaskItem>
      </template>
      <slot 
        name="deleteDoneTasks"
        v-if="tasks.length"
      >
      </slot>
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
      visiblePomodoroStartButton: true
    }
  },
  components: {
    TaskItem
  },
  created() {
    this.CloseStartPomodoroButton();
  },
  methods: {
    handleOpenPomodoroTimer(task) {
      this.$emit('handleOpenPomodoroTimer', task);
      localStorage.setItem("pomodoroTask", JSON.stringify(task));
      this.visiblePomodoroStartButton = false
    },
    handleOpenTaskEditModal(task) {
      this.$emit('handleOpenTaskEditModal', task)
    },
    handleOpenDetailTask(task) {
      this.$emit('handleOpenDetailTask', task)
    },
    deleteTask(task) {
      this.$emit('deleteTask', task)
    },
    changeTaskStatus(task) {
      this.$emit('changeTaskStatus', task)
    },
    CloseStartPomodoroButton() {
      if(localStorage.getItem('totalSeconds')) {
        this.visiblePomodoroStartButton = false
      }
    },
    OpenStartPomodoroButton() {
      this.visiblePomodoroStartButton = true
    }
  }
}
</script>