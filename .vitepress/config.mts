import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "CookieCMS",
  description: "Wiki",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    // nav: [
    //   { text: 'Home', link: '/' },
    //   { text: 'Examples', link: '/markdown-examples' }
    // ],
    search: {
      provider: 'local'
    },
    sidebar: [
      {
        text: 'Old',
        collapsed: true,
        items: [
          { text: 'SimpleCabinet (Deprecated)', link: 'https://github.com/Cookie-cms/simplecabinet' },
          { text: '1-beta', link: '/1-beta' },
          { text: '2-beta', link: '/2-beta', }
        ]
      },
      {
        text: 'Things',
        collapsed: true,
        items: [
          { text: 'Template engine', link: '/things/templateengine' },
          { text: 'Fixed 2d skin', link: '/things/2dskin', },
          { text: 'Simple-code', link: '/things/simplecode', },
          { text: 'Admin-access', link: '/things/adminaccess', }
        ]
      },
      {
        text: 'Development',
        collapsed: false,
        items: [
          { text: 'Api', link: '/dev' },
          { text: 'User permissions lvl', link: '/dev/usrpermlvl', },
          { text: 'Skin logic', link: '/dev/skinlogic', },
          { text: 'Discord auth', link: '/dev/discord', },
          { text: 'Verify codes', link: '/dev/verifycodes', },
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/vuejs/vitepress' }
    ]
  }
})
