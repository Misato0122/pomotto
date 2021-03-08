<template>
  <div>
    <audio src="#" />
    <h1>プロフィールページ</h1>
    <p>{{ user.name }}</p>
    <p>{{ user.email }}</p>
    <UserChart 
      v-if="loaded"
      :labels="labels"
      :datasets="datasets"
    />
    <button
      @click="handleOpenUserEditModal"
      class="btn btn-primary"
    >編集
    </button>

    <!-- ユーザー編集モーダル -->
    <transition name="fade">
      <UserEditModal
        :user="user"
        v-if="isVisibleUserEditModal"
        @close-modal="handleCloseUserEditModal"
        @update-user="handleUpdateUser"
      >
      </UserEditModal>
    </transition>
    <!-- ユーザー編集モーダルここまで -->
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import UserEditModal from './UserEditModal.vue';
import UserChart from './UserChart.vue';

export default {
  name: 'ProfilePage',
  data() {
    return {
      isVisibleUserEditModal: false,
      loaded: false
    }
  },
  components: {
    UserEditModal,
    UserChart,
  },
  computed: {
    ...mapGetters("users", ["user"])
  },
  mounted() {
    this.$axios.get('/pomodoro/pomodoro_count')
    .then(res => {
      this.labels = res.data.map(pomodoros => pomodoros.day)
      this.datasets = res.data.map(pomodoros => pomodoros.count)
      this.loaded = true
    })
    .catch(err => console.log(err.response))
  },
  methods: {
    ...mapActions("users", ["updateUser"]),
    handleOpenUserEditModal() {
      this.isVisibleUserEditModal = true
      this.user = Object.assign({}, user)
    },
    handleCloseUserEditModal() {
      this.isVisibleUserEditModal = false
    },
    async handleUpdateUser(user) {
      try{
        console.log(user)
        await this.updateUser(user)
        this.handleCloseUserEditModal();
      } catch(err) {
        console.log(err)
      }
    },
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