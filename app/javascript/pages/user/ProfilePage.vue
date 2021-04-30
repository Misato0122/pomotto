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
        <template v-if="user.role !== 'guest'">
        <v-btn
        @click="handleOpenDeleteUserModal(user)"
        >
        退会する 
        </v-btn>
        </template>
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
    <a 
      :href="twitterUrl"
      target='_blank' 
      class="btn btn--blue"
    >
      <v-icon>mdi-twitter</v-icon>勉強時間をシェア
    </a>
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
    <!--ユーザー削除確認モーダル-->
    <transition name="fade">
      <UserDeleteModal
        :user="user"
        v-if="isVisibleUserDeleteModal"
        @close-delete-modal="handleCloseUserDeleteModal"
        @delete-user="handleDeleteUser"
      >
      </UserDeleteModal>
    </transition>
    <!--ユーザー削除確認モーダルここまで-->
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import UserEditModal from './UserEditModal.vue';
import UserChart from './UserChart.vue';
import UserDeleteModal from './UserDeleteModal.vue';

export default {
  name: 'ProfilePage',
  data() {
    return {
      editUser: {},
      isVisibleUserEditModal: false,
      isVisibleUserDeleteModal: false,
      loaded: false,
      options: {
        responsive: false
      },
      height: 300,
      width: 1100,
      twitterUrl: ""
    }
  },
  components: {
    UserEditModal,
    UserChart,
    UserDeleteModal
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
      var pomo = this.datasets[0]
      if (pomo == null) {
        pomo = 0
      } else {
        pomo = pomo * 25
      }
      this.twitterUrl = "https://twitter.com/share?url=https://pomotto12345.herokuapp.com/&text=今日の勉強時間は" + pomo + "分だったよ!&hashtags=pomotto"
    })
    .catch(err => console.log(err.response))
    
  },
  methods: {
    ...mapActions("users", ["updateUser", "deleteUser"]),
    handleOpenUserEditModal(user) {
      this.isVisibleUserEditModal = true
      this.editUser = Object.assign({}, user)
    },
    handleCloseUserEditModal() {
      this.isVisibleUserEditModal = false
    },
    async handleUpdateUser(user) {
      try{
        await this.updateUser(user)
        this.handleCloseUserEditModal();
      } catch(err) {
        console.log(err)
      }
    },
    handleOpenDeleteUserModal(user) {
      this.isVisibleUserDeleteModal = true
    },
    handleCloseUserDeleteModal() {
      this.isVisibleUserDeleteModal = false;
    },
    async handleDeleteUser(user) {
      try{
        await this.deleteUser(user)
        this.handleCloseUserDeleteModal();
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
  .btn--blue,
  a.btn--blue {
    color: #fff;
    background-color: #00acee;
  }
  .btn--blue:hover,
  a.btn--blue:hover {
    color: #fff;
    background: #40e0d0;
  }

  .fa-position-left {
    position: absolute;
    top: calc(50% - .5em);
    left: 1rem;
  }

  .btn--radius,
  a.btn--radius,
  button.btn--radius
  {
      border-radius: 100vh;
  }
</style>