<template>
  <div class="col-2 col-lg-12">
    <div 
      :id="taskListId"
      class="bg-light rounded shadow m-3 p-3"
    >
      <slot name="header">
        タスク区分
      </slot>
      <template v-for="number in numbers">
      <TaskItem 
      :key="number"
      :number="number"
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
    taskListId: {
      type: String,
      require: true
    }
  },
  data() {
    return {
      numbers: [
        "1", "2", "3"
      ]
    }
  },
  components: {
    TaskItem
  }
}
</script>