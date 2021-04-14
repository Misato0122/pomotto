<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="info">
        <router-link
          :to="{ name: 'TopIndex' }"
          tag="b-navbar-brand"
          style="cursor: pointer;"
        >
        Pomotto
        </router-link>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <template v-if="!user">
            <b-nav-item right>
              <em
              @click="guestLogin"
              >
              ゲストログイン
              </em>
            </b-nav-item>
            <b-nav-item right>
              <router-link
                :to="{ name: 'RegisterPage' }"
                tag="em"
              >
              サインアップ
              </router-link>
              </b-nav-item>
              <b-nav-item right>
              <router-link
                :to="{ name: 'LoginPage' }"
                tag="em"
              >
              ログイン
              </router-link>
            </b-nav-item>
          </template>
          <template v-else>
            <b-nav-item right>
              <router-link
                :to="{ name: 'TaskIndex' }"
                tag="em"
              >
              Todoリスト
              </router-link>
            </b-nav-item>
            <b-nav-item right>
              <router-link
                :to="{ name: 'ProfilePage' }"
                tag="em"
              >
              マイページ
              </router-link>
            </b-nav-item>
            <b-nav-item 
              right
              @click="handleLogout"
            >
              ログアウト
            </b-nav-item>
          </template>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
export default {
  name: 'TheHeader',
  computed: {
    ...mapGetters("users", ["user"])
  },
  methods: {
    ...mapActions("users", ["logoutUser", "guestLogin"]),
    async handleLogout() {
      try {
        await this.logoutUser()
        window.location.href = "/"
      } catch(err) {
        console.log(err)
      }
    }
  }
}
</script>