<template>
  <div>
    <PomodoroTimerBlock
    v-if="isVisiblePomodoroTimerBlock"
    @openPomodoroTimerModal="handleOpenPomodoroTimerModal"
    >
    </PomodoroTimerBlock>

    <BreakTimerBlock
    v-if="isVisibleBreakTimerBlock"
    @closeBreakTimer="closeBreakTimer"
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
      @handleOpenTaskEditModal="handleOpenEditTaskModal"
      @handleOpenDetailTask="handleOpenDetailTask"
      :tasks="todoTasks"
      @changeTaskStatus="updateTask"
      @deleteTask="handleDeleteTask"
      @closePomodoroStartButton="handleCloseBreakTimerBlock"
      ref="taskList"
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
      @handleOpenDetailTask="handleOpenDetailTask"
      @changeTaskStatus="updateTask"
      @deleteTask="handleDeleteTask"
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
        @create-task="handleAddCreateTask"
        @close-modal="handleCloseCreateTaskModal"
      ></TaskCreateModal>
    </transition>
    <!-- タスク作成モーダルここまで -->

    <!-- タスク詳細モーダル -->
    <transition name="fade">
      <TaskDetailModal
        v-if="isVisibleTaskDetailModal"
        :task="detailTask"
        @close-modal="handleCloseDetailTaskModal"
      >
      </TaskDetailModal>
    </transition>
    <!-- タスク詳細モーダルここまで-->

    <!-- タスク編集モーダル-->
    <transition name="fade">
      <TaskEditModal
        v-if="isVisibleTaskEditModal"
        :task="editTask"
        @update-task="handleUpdateTask"
        @close-modal="handleCloseEditTaskModal"
      >
      </TaskEditModal>
    </transition>
    <!-- タスク編集モーダルここまで -->

    <!-- タイマーモーダル -->
      <PomodoroTimerModal
        v-if="isVisiblePomodoroTimerModal"
        @close-modal="handleClosePomodoroTimerModal"
        @createPomodoro="handleCreatePomodoro"
        :task="pomodoroTask"
      >
      </PomodoroTimerModal>
    <!-- タイマーモーダルここまで-->
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import { Howl } from 'howler';
import TaskList from './components/TaskList.vue';
import TaskCreateModal from './components/TaskCreateModal.vue';
import TaskEditModal from './components/TaskEditModal.vue';
import TaskDetailModal from './components/TaskDetailModal.vue';
import PomodoroTimerModal from './components/timer/PomodoroTimer.vue';
import PomodoroTimerBlock from './components/timer/PomodoroTimerBlock.vue';
import BreakTimerBlock from './components/timer/BreakTimer.vue';

export default {
  name: 'TaskIndex',
  data() {
    return {
      audio: null,
      pomodoroTask: {},
      detailTask: {},
      editTask: {},
      isVisibleTaskCreateModal: false,
      isVisibleTaskDetailModal: false,
      isVisibleTaskEditModal: false,
      isVisiblePomodoroTimerModal: false,
      isVisiblePomodoroTimerBlock: false,
      isVisibleBreakTimerBlock: false
    }
  },
  components: {
    TaskList,
    TaskCreateModal,
    TaskDetailModal,
    TaskEditModal,
    PomodoroTimerModal,
    PomodoroTimerBlock,
    BreakTimerBlock,
  },
  computed: {
    ...mapGetters("tasks", ["tasks"]),
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
    this.startPomodoroBlock();
    this.startBreakTimer();
  },
  methods: {
    ...mapActions("tasks", ["fetchTasks", "createTask", "updateTask", "deleteTask"]),
    handleOpenCreateTaskModal() {
      this.isVisibleTaskCreateModal = true;
    },
    handleCloseCreateTaskModal() {
      this.isVisibleTaskCreateModal = false;
    },
    handleOpenDetailTask(task) {
      this.isVisibleTaskDetailModal = true;
      this.detailTask = task
    },
    handleCloseDetailTaskModal() {
      this.isVisibleTaskDetailModal = false;
    },
    handleOpenEditTaskModal(task) {
      this.isVisibleTaskEditModal = true;
      this.editTask = Object.assign({}, task)
    },
    handleCloseEditTaskModal() {
      this.isVisibleTaskEditModal = false;
    },
    handleOpenPomodoroTimerModal(task) {
      this.isVisiblePomodoroTimerModal = true;
      this.pomodoroTask = task
      this.handleCloseBreakTimerBlock();
    },
    handleClosePomodoroTimerModal(task) {
      this.startPomodoroBlock();
      this.isVisiblePomodoroTimerModal = false;
      this.pomodoroTask = task
    },
    async handleAddCreateTask(task) {
      try{
        await this.createTask(task)
        this.handleCloseCreateTaskModal();
      } catch(err) {
        console.log(err)
      }
    },
    async handleUpdateTask(task) {
      try{
        await this.updateTask(task)
        this.handleCloseEditTaskModal();
      } catch(err) {
        console.log(err)
      }
    },
    async handleDeleteTask(task) {
      try{
        await this.deleteTask(task)
      } catch(err) {
        console.log(err)
      }
    },
    async deleteCompleteTask(tasks) {
      try{
        await tasks.map(task => this.deleteTask(task))
      } catch(err) {
        console.log(err)
      }
    },
    handleCreatePomodoro(task) {
      this.$axios.post('/pomodoro', {task_id: task.id})
      .then(res => {
        console.log(res.data),
        this.handleClosePomodoroTimerModal();
        this.closePomodoroBlock();
        this.isVisibleBreakTimerBlock = true
        this.$refs.taskList.OpenStartPomodoroButton();
      })
      .catch(err => console.log(err.status))
    },
    startBreakTimer() {
      if(localStorage.getItem('breakSeconds')){
        this.isVisibleBreakTimerBlock = true
      }
    },
    closeBreakTimer() {
      this.isVisibleBreakTimerBlock = false
    },
    startPomodoroBlock() {
      if(localStorage.getItem('totalSeconds')){
        this.isVisiblePomodoroTimerBlock = true
      }
    },
    closePomodoroBlock() {
      this.isVisiblePomodoroTimerBlock = false
    },
    handleCloseBreakTimerBlock() {
      if(localStorage.getItem('breakSeconds')){
        this.isVisibleBreakTimerBlock = false
        localStorage.removeItem('breakSeconds')
      }
    }
  },
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
