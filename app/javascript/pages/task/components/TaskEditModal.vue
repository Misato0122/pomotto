<template>
  <div id="task-create-modal">
    <div
      class="modal"
      @click.self="handleCloseModal"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <label for="title">タイトル</label>
            <input
              id="title"
              v-model="task.title"
              type="text"
              class="form-control"
            >
            <label for="content">説明文</label>
            <textarea
              id="content"
              v-model="task.content"
              class="form-control"
            />
            <label for="deadline">締め切り日</label>
            <input 
              type="date"
              id="deadline"
              v-model="task.deadline"
              class="form-control"
            >
          </div>
          <div class="modal-footer">
            <button
              class="btn btn-success"
              @click="updateTask(task)"
            >
              更新
            </button>
            <button
              type="button"
              class="btn btn-secondary"
              @click="handleCloseModal"
            >
              閉じる
            </button>
          </div>
        </div>
      </div>
    </div>
    <div class="modal-backdrop show" />
  </div>
</template>

<script>
export default {
  name: "TaskCreateModal",
  props: {
    task: {
      type: Object,
      required: true
    }
  },
  methods: {
    handleCloseModal() {
      this.$emit('close-modal')
    },
    updateTask(task) {
      this.$emit('update-task', task)
    }
  }
}
</script>

<style scoped>
  .modal {
    display: block;
  } 
</style>