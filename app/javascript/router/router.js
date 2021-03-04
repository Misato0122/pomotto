import Vue from 'vue';
import VueRouter from 'vue-router';
import store from '../store';

import TopIndex from "../pages/top/index.vue";
import TaskIndex from "../pages/task/index.vue";
import RegisterPage from '../pages/user/registerPage.vue';
import LoginPage from '../pages/user/loginPage.vue';
import ProfilePage from '../pages/user/ProfilePage.vue';


Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      component: TopIndex,
      name: "TopIndex"
    },
    {
    path: '/tasks',
    component: TaskIndex,
    name: "TaskIndex",
    meta: { requiredAuthenticated: true}
    },
    {
      path: '/register',
      component: RegisterPage,
      name: "RegisterPage"
    },
    {
      path: '/login',
      component: LoginPage,
      name: "LoginPage"
    },
    {
      path: '/profile',
      component: ProfilePage,
      name: "ProfilePage",
      meta: { requiredAuthenticated: true}
    }
  ]
})

router.beforeEach((to, from, next) => {
  store.dispatch('users/fetchLoginUser').then((user) => {
    if(to.matched.some(record => record.meta.requiredAuthenticated) && !user) {
      next({ name: 'LoginPage' });
    } else {
      next();
    }
  })
});

export default router