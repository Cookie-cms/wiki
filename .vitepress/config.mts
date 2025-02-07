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
        text: 'Old',
        collapsed: true,
        items: [
          { text: 'SimpleCabinet (Deprecated)', link: 'https://github.com/Cookie-cms/simplecabinet' },
          { text: '1-beta', link: '/1-beta' },
          { text: '2-beta', link: '/2-beta' }
        ]
      },
      {
        text: 'Things',
        collapsed: true,
        items: [
          { text: 'Template engine', link: '/things/templateengine' },
          { text: 'Fixed 2d skin', link: '/things/2dskin' },
          { text: 'Simple-code', link: '/things/simplecode' },
          { text: 'Admin-access', link: '/things/adminaccess' }
        ]
      },
      {
        text: 'Development',
        collapsed: false,
        items: [
          { text: 'Installation', link: '/dev/installation' },
          { text: 'Api', link: '/dev' },
          { text: 'Version rules', link: '/dev/verule' },
          {
            text: 'Changes',
            collapesd: false,
            items: [
              // This shows `/guide/index.md` page.
              { text: 'ChangeLog-backend', link: 'dev/changelog-backend.md' },
              { text: 'ChangeLog-Frontend', link: 'dev/changelog-frontend.md' }
            ]
          },
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