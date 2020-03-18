// mixins for using iview common methods

import Vue from 'vue'
import ViewUI from 'view-design';
import 'view-design/dist/styles/iview.css';
import locale from 'view-design/dist/locale/en-US'
import 'view-design/dist/styles/iview.css';

Vue.use(ViewUI, { locale })
Vue.mixin({

  methods: {
    i(msg, i = 'Hey!') {
      this.$Notice.info({
        title: i,
        desc: msg
      })
    },
    s(msg, i = 'Great!') {
      this.$Notice.success({
        title: i,
        desc: msg
      })
    },
    w(msg, i = 'Oops!') {
      this.$Notice.warning({
        title: i,
        desc: msg
      })
    },
    e(msg, i = 'Oops!') {
      this.$Notice.error({
        title: i,
        desc: msg

      })
    },
    swr() {
      this.$Notice.error({
        title: 'Oops',
        desc: 'Something went wrong, please try again later'
      })
    },

    // message

    ns(title) {
      this.$Message.success(title)
    },
    ni(title) {
      this.$Message.info(title)
    },
    nw(title) {
      this.$Message.warning(title)
    },
    ne(title) {
      this.$Message.error(title)
    },
    nswr() {
      this.$Message.error('Something went wrong, please try again later')
    }
  }
})
