import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  rewrites: {
    'source/:page': 'destination/:page'
  },
  title: "Cookiecms",
  description: "Cms for minecraft projects",
  lastUpdated: true,
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Examples', link: '/markdown-examples' }
    ],
    search: {
      provider: 'local'
    },
    footer: {
      message: 'Released under the <a href="https://github.com/vuejs/vitepress/blob/main/LICENSE">MIT License</a>.',
      copyright: 'Copyright © 2019-present <a href="https://github.com/yyx990803">Evan You</a>'
    },
    sidebar: {
        // This sidebar gets displayed when a user
        // is on `guide` directory.
        // '/0.1/': [
        //   {
        //     text: 'Guide',
        //     items: [
        //       { text: 'Index', link: '/0.1/' },
        //       { text: 'One', link: '/0.1/one' },
        //       { text: 'Two', link: '/0.1/two' }
        //     ]
        //   }
        // ],
  
        // This sidebar gets displayed when a user
        // is on `config` directory.
        '/1.0/': [
          {
            text: 'Guide',
            items: [
              { text: 'Index', link: '/1.0/' },
              { text: 'Three', link: '/1.0/three' },
              { text: 'Four', link: '/1.0/four' }
            ]
          },
          {
            text: 'FAQ',
            collapsed: true,
            items: [
              { text: 'Configs', link: '/1.0/faq#configs' },
              { text: 'How create page?', link: '/1.0/faq#how-create-page' },
              { text: 'Four', link: '/1.0/faq' }
            ]
          },
          
        ]
      },
  

        socialLinks: [
          { icon: 'github', link: 'https://github.com/vuejs/vitepress' }
        ],
      }
    })
