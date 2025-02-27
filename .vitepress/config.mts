// filepath: /home/misha/code/cookiecms/wiki2/.vitepress/config.mts
// import { defineConfig } from 'vitepress'
import { withMermaid } from "vitepress-plugin-mermaid";
import myVitePressPlugin from '../plugins/vitepress-plugin';

export default withMermaid({
  title: "CookieCMS Wiki",
  description: "Wiki",
  lastUpdated: true,

  themeConfig: {
    search: {
      provider: 'local'
    },
    sidebar: [
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
      {
        text: 'CookieCms',
        collapsed: false,
        items: [
          { text: 'Installation', link: '/dev/installation' },
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
    socialLinks: [
      { icon: 'github', link: 'https://github.com/Cookie-cms' },
      { icon: 'discord', link: 'https://discord.gg/4YQ3hNVm8P' }
    ]
  },
  
})