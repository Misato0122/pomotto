<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="info">
      <template v-if="!user">
        <router-link
          :to="{ name: 'TopIndex' }"
          tag="b-navbar-brand"
        >
        Pomotto
        </router-link>
      </template>
      <template v-else>
      <router-link
        :to="{ name: 'TaskIndex' }"
        tag="b-navbar-brand"
      >
        Pomotto
      </router-link>
      </template>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <template v-if="!user">
            <b-nav-item right>
              <router-link
                :to="{ name: 'LoginPage' }"
                tag="em"
              >
              Login
              </router-link>
            </b-nav-item>
          </template>
          <template v-else>
          <b-nav-item-dropdown right text="User">
              <router-link
                :to="{ name: 'TaskIndex' }"
                tag="b-dropdown-item"
                
              >
                タスク一覧
              </router-link>
              <router-link
                :to="{ name: 'ProfilePage' }"
                tag="b-dropdown-item"
                
              >
                Profile
              </router-link>
              <b-dropdown-item @click="handleLogout">Sign Out</b-dropdown-item>
          </b-nav-item-dropdown>
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
    ...mapActions("users", ["logoutUser"]),
    async handleLogout() {
      try {
        await this.logoutUser()
        this.$router.push({name: 'LoginPage'})
      } catch(err) {
        console.log(err)
      }
    }
  }
}
</script>