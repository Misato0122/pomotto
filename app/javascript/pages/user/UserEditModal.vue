<template>
  <div id="user-edit-modal">
    <div
      class="modal"
      @click.self="handleCloseModal"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <label for="name">名前</label>
            <input
              id="name"
              v-model="user.name"
              type="text"
              class="form-control"
            >
            <label for="email">メールアドレス</label>
            <textarea
              id="email"
              v-model="user.email"
              class="form-control"
            />
          </div>
          <div class="modal-footer">
            <button
              class="btn btn-success"
              @click="updateUser(user)"
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
    user: {
      type: Object,
      required: true
    }
  },
  methods: {
    handleCloseModal() {
      this.$emit('close-modal')
    },
    updateUser(user) {
      this.$emit('update-user', user)
    }
  }
}
</script>

<style scoped>
  .modal {
    display: block;
  } 
</style>