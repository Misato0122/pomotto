import Vue from 'vue';
import VueRouter from 'vue-router';

import TopIndex from "../pages/top/index.vue";
import TaskIndex from "../pages/task/index.vue";
import RegisterPage from '../pages/user/registerPage.vue';
import LoginPage from '../pages/user/loginPage.vue'


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
    name: "TaskIndex"
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
    }
  ]
})

export default router