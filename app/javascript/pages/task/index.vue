<template>
  <div>
    <PomodoroTimerBlock
    v-if="isVisiblePomodoroTimerBlock"
    >
    </PomodoroTimerBlock>
    <BreakTimerBlock
    v-if="isVisibleBreakTimerBlock"
    >
    </BreakTimerBlock>

    <button 
      class="btn btn-secondary"
      @click="handleOpenCreateTaskModal"
    >
      タスク作成
    </button>

    <TaskList
      task-list-id="todo-list"
      @handleOpenPomodoroTimer="handleOpenPomodoroTimerModal"
      :tasks="todoTasks"
      @changeTaskStatus="updateTask"
    >
      <template #header>
        <div class="h4">
          やることリスト
        </div>
      </template>
    </TaskList>

    <TaskList
      task-list-id="done-list"
      @handleOpenPomodoroTimer="handleOpenPomodoroTimerModal"
      :tasks="doneTasks"
      @changeTaskStatus="updateTask"
    >
      <template #header>
        <div class="h4">
          完了タスク
        </div>
      </template>
    </TaskList>
    <button
      class="btn btn-danger"
      @click="deleteCompleteTask(doneTasks)"
    >
      完了済みのタスクを削除
    </button>
    <router-link
      :to="{ name: 'TopIndex' }"
      class="btn btn-primary mr-5"
    >
    戻る
    </router-link>
    
    <!-- タスク作成モーダル -->
    <transition name="fade">
      <TaskCreateModal
        v-if="isVisibleTaskCreateModal"
        @create-task="createTask"
        @close-modal="handleCloseCreateTaskModal"
      ></TaskCreateModal>
    </transition>
    <!-- タスク作成モーダルここまで -->

    <!-- タイマーモーダル -->
      <PomodoroTimerModal
        v-if="isVisiblePomodoroTimerModal"
        @close-modal="handleClosePomodoroTimerModal"
        :task="pomodoroTask"
      >
      </PomodoroTimerModal>
    <!-- タイマーモーダルここまで-->
  </div>
</template>

<script>
import TaskList from './components/TaskList.vue';
import TaskCreateModal from './components/TaskCreateModal.vue';
import PomodoroTimerModal from './components/timer/PomodoroTimer.vue';
import PomodoroTimerBlock from './components/timer/PomodoroTimerBlock.vue';
import BreakTimerBlock from './components/timer/BreakTimer.vue';
export default {
  name: 'TaskIndex',
  data() {
    return {
      pomodoroTask: {},
      tasks: [],
      isVisibleTaskCreateModal: false,
      isVisiblePomodoroTimerModal: false,
      isVisiblePomodoroTimerBlock: false,
      isVisibleBreakTimerBlock: false
    }
  },
  components: {
    TaskList,
    TaskCreateModal,
    PomodoroTimerModal,
    PomodoroTimerBlock,
    BreakTimerBlock
  },
  computed: {
    todoTasks: function() {
      return this.tasks.filter(function(task){
        return task.status == "todo"
      })
    },
    doneTasks: function() {
      return this.tasks.filter(function(task){
        return task.status == "done"
      })
    },
  },
  created() {
    this.fetchTasks();
  },
  methods: {
    handleOpenCreateTaskModal() {
      this.isVisibleTaskCreateModal = true;
    },
    handleCloseCreateTaskModal() {
      this.isVisibleTaskCreateModal = false;
    },
    handleOpenPomodoroTimerModal(task) {
      this.isVisiblePomodoroTimerModal = true;
      this.pomodoroTask = task
    },
    handleClosePomodoroTimerModal() {
      this.isVisiblePomodoroTimerModal = false
    },
    fetchTasks() {
      this.$axios.get("tasks")
      .then(res => this.tasks = res.data)
      .catch(err => console.log(err.status));
    },
    createTask(task) {
      this.$axios.post("tasks", task)
      .then(res => this.tasks.push(res.data))
      .catch(err => console.log(err.status));
      this.handleCloseCreateTaskModal();
    },
    updateTask(task) {
      this.$axios.patch(`tasks/${task.id}`, task)
      .then(res => console.log(task))
      .catch(err => console.log(err.status));
    },
    deleteCompleteTask(tasks) {
      tasks.map(task => this.$axios.delete(`tasks/${task.id}`, task))
      .then(res => console.log(res))
      .catch(err => console.log(err.status))
    },
    deleteTask(deleteTask) {
      this.tasks.filter(task => {
        return task.id != deleteTask.id
      })
    }
  }
}
</script>

<style scoped>
  .fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
  }
  .fade-enter, .fade-leave-to {
    opacity: 0;
  }
</style>