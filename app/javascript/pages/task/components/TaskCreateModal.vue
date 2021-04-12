<template>
  <div id="task-create-modal">
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
                  name="見出し"
                  rules="required"
                >
                  <v-text-field
                    v-model="task.title"
                    label="見出し"
                    required
                  >
                  </v-text-field>
                  <span class="text-danger">{{ errors[0] }}</span>
                </validation-provider>
                <validation-provider
                  v-slot="{ errors }"
                  name="詳細"
                >
                  <v-text-field
                    v-model="task.content"
                    label="詳細"
                    description="こちらは入力しなくても大丈夫です"
                  >
                  </v-text-field>
                  <span class="text-danger">{{ errors[0] }}</span>
                </validation-provider>
                <validation-provider
                  v-slot="{ errors }"
                  name="締め切り日"
                  rules="required"
                >
                  <div class="subheading">
                    締め切り日
                  </div>
                  <v-date-picker
                    v-model="task.deadline"
                    label="締め切り日"
                    required
                  >
                  </v-date-picker>
                  <span class="text-danger">{{ errors[0] }}</span>
                </validation-provider>
                <br>
                <v-btn
                  block
                  color="success"
                  @click="createTask(task)"
                  type="submit"
                  :disabled="invalid"
                >
                やること追加
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
  data() {
    return {
      task: {
        title: "",
        content: "",
        status: "todo",
        deadline: ""
      }
    }
  },
  computed: {
    titleState() {
      return this.task.title.length >= 1
    },
    deadlineState() {
      return this.task.deadline != null
    },
    invalidTitleFeedback() {
      return 'タスクを入力してください'
    },
    invalidDeadlineFeedback() {
      return '必ず締め切り日を入れてください'
    }
  },
  methods: {
    handleCloseModal() {
      this.$emit('close-modal')
    },
    createTask(task) {
      this.$emit('create-task', task)
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