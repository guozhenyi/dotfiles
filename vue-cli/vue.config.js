module.exports = {
  configureWebpack: {
    // 配置打包时，排除的包
    externals: {
      api: 'window.api',
      axios: 'window.axios',
      vue: 'window.Vue',
      'vue-router': 'window.VueRouter',
      'element-ui': 'window.ELEMENT',
      echarts: 'window.echarts',
      vant: 'window.vant',
    },
  },
};
