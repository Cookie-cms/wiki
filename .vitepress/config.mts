import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Cookie wiki",
  description: "How setup",
  lastUpdated: true,
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    editLink: {
      pattern: 'https://github.com/Cookie-cms/wiki/edit/main/:path'
    },
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Install', link: '/installation' },
      { text: 'Keys', link: 'https://coffeedev.dev/keys/index.php' },

    ],

    sidebar: [
      {
        // text: 'Examples',
        items: [
          { text: 'Installation site', link: '/installation' },
          { text: 'Installation bot', link: '/installationb' },
          { text: 'Q&A', link: '/QA' },
          { text: 'Api', link: '/api' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'discord', link: 'https://discord.gg/4YQ3hNVm8P' },
      { icon: 'github', link: 'https://github.com/Cookie-cms' }
    ]
  }
})


