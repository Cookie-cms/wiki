// filepath: /home/misha/code/cookiecms/wiki2/.vitepress/config.mts
// import { defineConfig } from 'vitepress'
import { withMermaid } from "vitepress-plugin-mermaid";
// import myVitePressPlugin from '../plugins/vitepress-plugin';

export default withMermaid({
  title: "CookieCMS Wiki",
  description: "Wiki",
  lastUpdated: true,
  ignoreDeadLinks: [
    /^https?:\/\/localhost/,
  ],

  themeConfig: {
    search: {
      provider: 'local'
    },
    sidebar: [
      {
        text: 'CookieCms',
        collapsed: false,
        items: [
          { text: 'About', link: '/About' },
          { text: 'Installation', link: '/v1/installation' },
          {
            text: 'Api documentation',
            items: [
              { text: 'Information', link: '/v1/api/' },
              { text: 'Auth', link: '/v1/api/auth' },
              { text: 'Home', link: '/v1/api/home' },
              { text: 'Admin', link: '/v1/api/admin' },
              { text: 'Get skins', link: '/v1/api/getskins' },
              { text: 'Service', link: '/v1/api/service' },

            ]
          },
          // { text: 'Theards', link: '/v1/api/theards' },
          { text: 'Version rules', link: '/verule' },
          { text: 'Changes', link: '/changelog' },
          { text: 'Configuration', link: '/v2/configuration' },
          { text: 'User permissions lvl', link: '/v1/usrpermlvl', },
          { text: 'Skin logic', link: '/v1/skinlogic', },
          { text: 'Discord auth', link: '/v1/discord', },
          { text: 'Verify codes', link: '/v1/verifycodes', },
          { text: 'How install private pkg?', link: '/package', },
          { text: 'Cookie Bot', link: '/cookiebot', },
          { text: 'How create page?', link: '/createpage' },
        ]
      },
      {
        text: 'Old (Deprecated)',
        collapsed: true,
        items: [
          { text: 'SimpleCabinet', link: 'https://github.com/Cookie-cms/simplecabinet' },
          { text: '1-beta', link: '/1-beta' },
          { text: '2-beta', link: '/2-beta' }
        ]
      },
      {
        text: 'Things (Deprecated)',
        collapsed: true,
        items: [
          { text: 'Template engine', link: '/things/templateengine' },
          { text: 'Fixed 2d skin', link: '/things/2dskin' },
          { text: 'Simple-code', link: '/things/simplecode' },
          { text: 'Admin-access', link: '/things/adminaccess' }
        ]
      },
    ],
    socialLinks: [
      { icon: 'github', link: 'https://github.com/Cookie-cms' },
      { icon: 'discord', link: 'https://discord.gg/4YQ3hNVm8P' }
    ]
  },
  
  
})