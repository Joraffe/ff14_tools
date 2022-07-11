import Vue from 'vue'
import Router from 'vue-router'
import LoggedOut from '@/components/LoggedOut.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'LoggedOut',
      component: LoggedOut
    }
  ]
})
