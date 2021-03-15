<template>
  <div id="user-edit-modal">
    <div
      class="modal"
      @click.self="handleCloseModal"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
          <validation-observer
          ref="obserber"
          v-slot="{ invalid }"
          >
          <v-form @submit.prevent="submit">
            <validation-provider
              v-slot="{ errors }"
              name="ユーザー名"
              rules="required"
            >
              <v-text-field
                v-model="user.name"
                label="ユーザー名"
                required
              >
              </v-text-field>
              <span class="text-danger">{{ errors[0] }}</span>
            </validation-provider>
            <validation-provider
              v-slot="{ errors }"
              name="プロフィール"
            >
              <v-text-field
                v-model="user.description"
                label="プロフィール"
                required
              >
              </v-text-field>
              <span class="text-danger">{{ errors[0] }}</span>
            </validation-provider>
            <v-btn
            block
            color="success"
            class="mr-4"
            @click="updateUser(user)"
            type="submit"
            :disabled="invalid"
            >
              更新
            </v-btn>
          </v-form>
          </validation-observer>
          </div>
          <div class="modal-footer">
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
      this.$emit('close-modal')
    },
    updateUser(user) {
      this.$emit('update-user', user)
    },
    submit() {
      this.$refs.observer.validate()
    }
  }
}
</script>

<style scoped>
  .modal {
    display: block;
  } 
</style>