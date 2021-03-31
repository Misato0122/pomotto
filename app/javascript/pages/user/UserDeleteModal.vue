<template>
  <div id="user-edit-modal">
    <div
      class="modal"
      @click.self="handleCloseModal"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <p>ユーザー情報ややることリストの内容が全て消えてしまいますがよろしいですか？</p>
          </div>
          <div class="modal-footer">
            <v-btn
            @click="handleDeleteUser(user)"
            >
              退会する
            </v-btn>
            <v-btn
              @click="handleCloseModal"
              color="secondary"
            >
              閉じる
            </v-btn>
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
      this.$emit('close-delete-modal')
    },
    handleDeleteUser(user){
      this.$emit('delete-user', user)
    }
  }
}
</script>

<style scoped>
  .modal {
    display: block;
  } 
</style>