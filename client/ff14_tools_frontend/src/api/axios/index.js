import axios from 'axios'

const API_URL = 'http://localhost:6060'

/* =======================
      Axios Instances
========================= */
export const createSecureAxiosInstance = () => {
  const secureAxiosInstance = axios.create({
    baseURL: API_URL,
    withCredentials: true,
    headers: {
      'Content-Type': 'application/json'
    }
  })

  secureAxiosInstance.interceptors.request.use(interceptSecureRequest)
  secureAxiosInstance.interceptors.response.use(null, interceptSecureResponseError)

  return secureAxiosInstance
}

export const createPlainAxiosInstance = () => {
  return axios.create({
    baseURL: API_URL,
    withCredentials: true,
    headers: {
      'Content-Type': 'application/json'
    }
  })
}

/* =======================
   Axios Interceptors
========================= */
const interceptSecureRequest = (config) => {
  const method = config.method.toUpperCase()
  if (method !== 'OPTIONS' && method !== 'GET') {
    config.headers = {
      ...config.headers,
      'X-CSRF-TOKEN': localStorage.csrf
    }
  }

  return config
}

const interceptSecureResponseError = (error) => {
  const axiosInstance = createPlainAxiosInstance()

  if (error.response && error.response.config && error.response.status === 401) {
    return axiosInstance
      .post('/refresh', {}, {headers: {'X-CSRF-TOKEN': localStorage.csrf}})
      .then((response) => {
        localStorage.csrf = response.data.csrf
        localStorage.signedIn = true

        let retryConfig = error.response.config
        retryConfig.headers['X-CSRF-TOKEN'] = localStorage.csrf
        return axiosInstance.request(retryConfig)
      })
      .catch((response) => {
        localStorage.csrf = response.data.csrf
        localStorage.signedIn = true

        let retryConfig = error.response.config
        retryConfig.headers['X-CSRF-TOKEN'] = localStorage.csrf
        return axiosInstance.request(retryConfig)
      })
  } else {
    return Promise.reject(error)
  }
}
