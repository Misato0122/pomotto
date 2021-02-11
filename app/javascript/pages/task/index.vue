<template>
  <div>
    <button class="btn btn-secondary">タスク作成</button>
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
  </div>
</template>

<script>
import TaskList from './conponents/TaskList.vue'
export default {
  name: 'TaskIndex',
  components: {
    TaskList
  }
}
</script>