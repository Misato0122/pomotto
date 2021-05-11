<template>
  <div>
    <div class="card my-3 p-10">
      <div class="card-body text-align-center">
        <div class="row">
          <div class="col-md-12 col-md-8 col-sm-12 col-xs-10">
            <div class="status_change_button">
              <input 
              :id="'change_status' + task.id"
              type="checkbox"
              v-model="task.status" 
              true-value="done" 
              false-value="todo" 
              @change="changeTaskStatus(task)"
              >
              <label
                :for="'change_status' + task.id"
              >
                <v-icon>
                  mdi-check-bold
                </v-icon>
              </label>
            </div>
            <span class="card-title text-center" style="font-size: 20px;">{{ task.title }}</span>
              <br>
              <span class="card-text text-center" style="font-size: 15px; color: #00917c;">締め切り日:  {{ task.deadline }}</span>
            <span class="float-right">
              <slot name="start-button">
              </slot>
              <v-btn
                @click="handleOpenDetailTaskModal(task)"
                fab
                color="light-blue"
              >
                <v-icon>
                  mdi-clipboard-text-outline
                </v-icon>
              </v-btn>
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
    </div>
  </div>
</template>

<script>
export default {
  name: 'TaskItem',
  data() {
    return {
      visiblePomodoroStartButton: true,
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

<style scoped>
  .status_change_button{
    display:inline-block;
    position: relative;
}
.status_change_button input{
    opacity: 0;
    position: absolute;
    left: 0;
}
.status_change_button label{
    padding: 10px 20px;
    border-radius: 20px;
    background: #eee;
    display: inline-block;
    cursor: pointer;
    transition: .5s;
}
.status_change_button label:hover,
.status_change_button input:checked + label{
    background: #17b978;
    color: #FFF;
}
.status_change_button input:focus + label{
    box-shadow: 0 0 4px #af975e;
}
</style>

