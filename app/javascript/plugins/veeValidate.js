import Vue from 'vue'

import {
  ValidationProvider,
  ValidationObserver,
  extend
} from 'vee-validate'

import {
  email,
  required,
  min
} from 'vee-validate/dist/rules'

Vue.component('ValidationObserver', ValidationObserver)
Vue.component('ValidationProvider', ValidationProvider)

extend('email', {
  ...email,
  message: '有効な{_field_}で入力してください'
})

extend('required', {
  ...required,
  message: '{_field_}は必須項目です'
})

extend('min', {
  ...min,
  message: '{_field_}は{length}文字以上である必要があります'
})

extend('password_confirmed', {
  params: ['target'],
  validate(value, { target }) {
    return value === target;
  },
  message: 'パスワードと一致しません'
})