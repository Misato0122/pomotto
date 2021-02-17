<template>
  <div id="task-create-modal">
    <div
      class="modal"
      @click.self="handleCloseModal"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <b-form-group
              id="title"
              label="タイトル"
              label-for="title"
              valid-feedback="OK!"
              :invalid-feedback="invalidTitleFeedback"
              :state="titleState"
            >
              <b-form-input id="title" v-model="task.title" trim></b-form-input>
            </b-form-group>
            <b-form-group
              id="content"
              label="詳細"
              label-for="content"
              description="こちらは入力しなくても大丈夫です"
            >
              <b-form-textarea id="content" v-model="task.content"></b-form-textarea>
            </b-form-group>
            <b-form-group
              id="deadline"
              label="締め切り日"
              label-for="deadline"
              :invalid-feedback="invalidDeadlineFeedback"
              :state="deadlineState"
            >
              <b-form-datepicker 
                type="date"
                id="deadline"
                v-model="task.deadline"
                class="mb-2"
              />
            </b-form-group>
          </div>
          <div class="modal-footer">
            <button
              class="btn btn-success"
              @click="createTask(task)"
            >
              追加
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
    }
  }
}
</script>

<style scoped>
  .modal {
    display: block;
  } 
</style>