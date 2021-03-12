<template>
  <div>
    <div class="card my-3 p-10">
      <div class="card-body text-align-center">
          <span>
          <input 
          type="checkbox"
          v-model="task.status" 
          true-value="done" 
          false-value="todo" 
          @change="changeTaskStatus(task)"
          >
          </span>
          <span class="card-title text-center" style="font-size: 25px;">{{ task.title }}</span>
          <br>
          <span class="card-text text-center" style="font-size: 15px; color: #00917c;">締め切り日:  {{ task.deadline }}</span>
        <span class="float-right">
          <v-btn
            @click="handleOpenDetailTaskModal(task)"
            fab
            color="light-blue"
          >
            <v-icon>
              mdi-dots-horizontal
            </v-icon>
          </v-btn>
          <slot name="start-button">
          </slot>
          <v-btn
            fab
            color="#b4aee8"
            v-if="task.status == 'todo'" 
            @click="handleOpenEditTaskModal(task)"
          >
            <v-icon dark>
              mdi-pencil
            </v-icon>
          </v-btn>
          <v-btn
            fab
            color="red"
            v-if="task.status == 'done'" 
            @click="handleDeleteTask(task)"
          >
            <v-icon dark>
              mdi-delete
            </v-icon>
          </v-btn>
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

