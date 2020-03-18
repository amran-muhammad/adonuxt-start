'use strict'

const resolve = require('path').resolve

module.exports = {
  modules: [
    '@nuxtjs/axios',
    '@nuxtjs/moment',
  ],

  axios: {
    // baseURL: 'https://admin.appifylab.com'
     baseURL: 'http://localhost:3000'
  },

  plugins: [
    '~plugins/axios',
    '~plugins/iview',
    '~plugins/commonModules',
    // { src: '~plugins/jquery', ssr: false },
  ],

  /*
  ** Headers of the page
  */
  head: {
    title: 'Appifylab MarketPlace Admin',
    meta: [
      {
        charset: 'utf-8'
      },
      {
        name: 'viewport',
        content: 'width=device-width, initial-scale=1'
      },
      {
        hid: 'description',
        name: 'description',
        content: 'Appifylab MarketPlace Admin'
      }
    ],
    link: [
      {
        rel: 'icon',
        type: 'image/x-icon',
        href: 'favicon.ico'
      },

      { rel: 'stylesheet', href: "/css/bootstrap.min.css" },
      { rel: 'stylesheet', href: "/css/common.css" },
      { rel: 'stylesheet', href: "/css/main.css" },
      { rel: 'stylesheet', href: "https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,900&display=swap" },
      { rel: 'stylesheet', href: "https://use.fontawesome.com/releases/v5.8.2/css/all.css" },
    ],

    script: [
      { src: '/js/script.js', body: true },
      // { src: '/js/jquery.counterup.min.js', body: false },
    ]
  },

  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#3177f1' },
  /*
  ** Point to resources
  */
  srcDir: resolve(__dirname, '..', 'resources')
}
