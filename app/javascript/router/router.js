import Vue from 'vue';
import VueRouter from 'vue-router';

import TopIndex from "../pages/top/index.vue";
import TaskIndex from "../pages/task/index.vue";
import TaskDetail from "../pages/task/components/TaskDetail.vue";


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
      path: '/tasks/show',
      component: TaskDetail,
      name: 'TaskDetail'
    },
  ]
})

export default router