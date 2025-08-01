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
    sidebar: {
      '/dev/': [
        {
        text: 'CookieCms',
        collapsed: false,
        items: [
          {
            text: 'Api documentation',
            items: [
              { text: 'Information', link: '/dev/api/' },
              { text: 'Auth', link: '/dev/api/auth' },
              { text: 'Home', link: '/dev/api/home' },
              { text: 'Admin', link: '/dev/api/admin' },
              { text: 'Get skins', link: '/dev/api/getskins' },
              { text: 'Service', link: '/dev/api/service' },

            ]
          },
          // { text: 'Theards', link: '/dev/api/theards' },
          { text: 'Version rules', link: '/dev/verule' },
          { text: 'Changes', link: 'dev/changelog.md' },
          { text: 'Configuration', link: '/dev/configuration' },
          { text: 'User permissions lvl', link: '/dev/usrpermlvl', },
          { text: 'Skin logic', link: '/dev/skinlogic', },
          { text: 'Discord auth', link: '/dev/discord', },
          { text: 'Verify codes', link: '/dev/verifycodes', },
          { text: 'How install private pkg?', link: '/dev/package', },
        ]
      },
      ],
      '/v1/': [
        {
        text: 'CookieCms',
        collapsed: false,
        items: [
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
          // { text: 'Theards', link: '/dev/api/theards' },
          { text: 'Version rules', link: '/verule' },
          { text: 'Changes', link: '/changelog.md' },
          { text: 'Configuration', link: '/v1/configuration' },
          { text: 'User permissions lvl', link: '/v1/usrpermlvl', },
          { text: 'Skin logic', link: '/v1/skinlogic', },
          { text: 'Discord auth', link: '/v1/discord', },
          { text: 'Verify codes', link: '/v1/verifycodes', },
          { text: 'How install private pkg?', link: '/dev/package', },
        ]
      },
      ],
      '/v2/': [
        {
          text: 'Guide',
          items: [
          { text: 'About', link: '/about' },
          { text: 'Installation', link: '/v2/installation' },
          {
            text: 'Api documentation',
            items: [
              { text: 'Information', link: '/v2/api/' },
              { text: 'Auth', link: '/v2/api/auth' },
              { text: 'Home', link: '/v2/api/home' },
              { text: 'Admin', link: '/v2/api/admin' },
              { text: 'Get skins', link: '/v2/api/getskins' },
              { text: 'Service', link: '/v2/api/service' },

            ]
          },
          // { text: 'Theards', link: '/v1/api/theards' },
          { text: 'Version rules', link: '/verule' },
          { text: 'Changes', link: '/changelog' },
          { text: 'Configuration', link: '/v2/configuration' },
          { text: 'User permissions lvl', link: '/v2/usrpermlvl', },
          { text: 'Skin logic', link: '/v2/skinlogic', },
          { text: 'Discord auth', link: '/v2/discord', },
          { text: 'Verify codes', link: '/v2/verifycodes', },
          { text: 'Cookie Bot', link: '/v2/cookiebot', },
          {
            text: 'FAQ',
            collapsed: true,
            items: [
              { text: 'How create page?', link: '/createpage' },
              { text: 'How install private pkg?', link: '/package' },
              { text: 'How change mail template?', link: '#' },

            ]
          },
          ]
        }
      ],          
  },
    socialLinks: [
      { icon: 'github', link: 'https://github.com/Cookie-cms' },
      { icon: 'discord', link: 'https://discord.gg/4YQ3hNVm8P' }
    ],
    nav: [
      {
        text: 'Версия',
        items: [
          { text: 'Dev', link: '/dev/' },
          { text: 'v1', link: '/v1/' },
          { text: 'v2', link: '/v2/' }
        ]
      }
    ]
  },
  
  
})