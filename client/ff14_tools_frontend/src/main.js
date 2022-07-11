import 'materialize-css/dist/css/materialize.min.css'
import Vue from 'vue'
import VueAxios from 'vue-axios'

import { createSecureAxiosInstance, createPlainAxiosInstance } from './api/axios'
import App from './App'
import router from './router'

const secureAxiosInstance = createSecureAxiosInstance()
const plainAxiosInstance = createPlainAxiosInstance()

Vue.config.productionTip = false
Vue.use(
  VueAxios,
  {
    secured: secureAxiosInstance,
    plain: plainAxiosInstance
  }
)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  secureAxiosInstance,
  plainAxiosInstance,
  components: { App },
  template: '<App/>'
})
