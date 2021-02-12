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
    >
      <template #header>
        <div class="h4">
          完了タスク
        </div>
      </template>
    </TaskList>
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
        @close-modal="handleCloseCreateTaskModal"
      ></TaskCreateModal>
    </transition>
    <!-- タスク作成モーダルここまで -->

    <!-- タイマーモーダル -->
      <PomodoroTimerModal
        v-if="isVisiblePomodoroTimerModal"
        @close-modal="handleClosePomodoroTimerModal"
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
import BreakTimerBlock from './components/timer/BreakTimer.vue'
export default {
  name: 'TaskIndex',
  data() {
    return {
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
  methods: {
    handleOpenCreateTaskModal() {
      this.isVisibleTaskCreateModal = true;
    },
    handleCloseCreateTaskModal() {
      this.isVisibleTaskCreateModal = false;
    },
    handleOpenPomodoroTimerModal() {
      this.isVisiblePomodoroTimerModal = true;
    },
    handleClosePomodoroTimerModal() {
      this.isVisiblePomodoroTimerModal = false
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