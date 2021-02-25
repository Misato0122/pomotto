<template>
  <div>
    <h1>プロフィールページ</h1>
    <p>{{ user.name }}</p>
    <p>{{ user.email }}</p>
    <UserChart />
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
      isVisibleUserEditModal: false
    }
  },
  components: {
    UserEditModal,
    UserChart
  },
  computed: {
    ...mapGetters("users", ["user"])
  },
  created() {
    this.fetchUser()
  },
  methods: {
    ...mapActions("users", ["fetchUser"]),
    handleOpenUserEditModal() {
      this.isVisibleUserEditModal = true
      this.user = Object.assign({}, user)
    },
    handleCloseUserEditModal() {
      this.isVisibleUserEditModal = false
    }
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