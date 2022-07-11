<template>
  <div class="container">
    <h4 class="center-align">Sign Up / Sign In</h4>
      <form class="col s12" @submit.prevent="">

        <div class="row">
          <div v-if="error">{{ error }}</div>
        </div>

        <div class="row">
          <div class="input-field col s12">
            <input id="email" type="email" class="validate" v-model="email">
            <label for="email">Email Address</label>
          </div>
        </div>

        <div class="row">
          <div class="input-field col s12">
            <input id="password" type="password" class="validate" v-model="password">
            <label for="password">Password</label>
          </div>
        </div>

        <div class="row">
          <div class="col s6 left-align">
            <button class="waves-effect waves-light btn blue darken-4" @click="onClickSignUp">Sign Up</button>
          </div>
          <div class="col s6 right-align">
            <button class="waves-effect waves-light btn" type="submit" @click="onClickSignIn">Sign In</button>
          </div>
        </div>
      </form>
  </div>
</template>

<script>
import M from 'materialize-css'

export default {
  name: 'LoggedOut',
  data () {
    return {
      email: '',
      password: '',
      error: ''
    }
  },
  created () {
    this.checkSignedIn()
  },
  updated () {
    this.checkSignedIn()
  },
  mounted () {
    M.updateTextFields()
  },
  methods: {
    onClickSignUp () {
      this.$http.plain.post('/signup', { email: this.email, password: this.password })
        .then(response => this.onSignInSuccess(response))
        .catch(error => this.onSignInFailure(error))
    },
    onSignUpSuccess () {
      // TODO
    },
    onSignUpFailure () {
      // TODO
    },
    onClickSignIn () {
      this.$http.plain.post('/signin', { email: this.email, password: this.password })
        .then(response => this.onSignInSuccess(response))
        .catch(error => this.onSignInFailure(error))
    },
    onSignInSuccess (response) {
      if (!response.data.csrf) {
        this.signinFailed(response)
        return
      }

      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/dashboard')
    },
    onSignInFailure (error) {
      this.error = (error.response && error.response.data && error.response.data.error) | ''
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/dashboard')
      }
    }
  }
}
</script>
