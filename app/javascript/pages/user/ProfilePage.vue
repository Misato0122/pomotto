<template>
  <div>
    <div class="my-5 main-content">
    <v-card>
      <div class="container row">
        <div class="col-md-11 col-12">
          <v-list-item theme--right>
            <v-avatar
              size="85"
            >
              <img src="https://firebasestorage.googleapis.com/v0/b/pomotto.appspot.com/o/%E3%83%88%E3%83%9E%E3%83%88%E9%80%8F%E9%81%8E.png?alt=media&token=9b09bffd-a430-4933-8f43-b23a525e634d">
            </v-avatar>
            <p>{{ user.name }}</p>
          </v-list-item>
          <div class="v-card__text">
            {{ user.description }}
          </div>
        </div>
      <div class="col-md-1 col-9">
        <v-btn
          @click="handleOpenUserEditModal(user)"
          color="primary"
        >編集
        </v-btn>
      </div>
    <UserChart 
      v-if="loaded"
      :labels="labels"
      :datasets="datasets"
      :options="options"
      :height="height"
      :width="width"
    />
      </div>
    </v-card>
    </div>

    <!-- ユーザー編集モーダル -->
    <transition name="fade">
      <UserEditModal
        :user="editUser"
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
      editUser: {},
      isVisibleUserEditModal: false,
      loaded: false,
      options: {
        responsive: false
      },
      height: 300,
      width: 1100
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
    handleOpenUserEditModal(user) {
      console.log(user)
      this.isVisibleUserEditModal = true
      this.editUser = Object.assign({}, user)
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
  .v-card__text {
    font-size: 20px;
  }
</style>