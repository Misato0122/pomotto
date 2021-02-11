<template>
  <div>
    <button 
      class="btn btn-secondary"
      @click="handleOpenCreateTaskModal"
    >
      タスク作成
    </button>
    <TaskList
      task-list-id="todo-list"
    >
      <template #header>
        <div class="h4">
          やることリスト
        </div>
      </template>
    </TaskList>

    <TaskList
            task-list-id="done-list"
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
  </div>
</template>

<script>
import TaskList from './conponents/TaskList.vue'
import TaskCreateModal from './conponents/TaskCreateModal'
export default {
  name: 'TaskIndex',
  data() {
    return {
      isVisibleTaskCreateModal: false
    }
  },
  components: {
    TaskList,
    TaskCreateModal
  },
  methods: {
    handleOpenCreateTaskModal() {
      this.isVisibleTaskCreateModal = true;
    },
    handleCloseCreateTaskModal() {
      this.isVisibleTaskCreateModal = false;
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