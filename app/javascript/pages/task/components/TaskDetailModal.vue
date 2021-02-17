<template>
  <div id="task-detail-modal">
    <div
      class="modal"
      @click.self="handleCloseModal"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            {{ task.status }}
            <br>
            {{ task.title}}
            <br>
            {{ task.content}}
            <br>
            {{ task.deadline}}
            <br>
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
  name: "TaskDetailModal",
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
  }
}
</script>

<style scoped>
  .modal {
    display: block;
  } 
</style>