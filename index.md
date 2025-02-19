---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: "CookieCMS"
  text: "Wiki"
  # tagline: My great project tagline
  actions:
    - theme: brand
      text: Demo
      link: https://cookiecms.coffeedev.dev/
    - theme: alt
      text: Wiki
      link: /dev

# features:
#   - title: Feature A
#     details: Lorem ipsum dolor sit amet, consectetur adipiscing elit
#   - title: Feature B
#     details: Lorem ipsum dolor sit amet, consectetur adipiscing elit
#   - title: Feature C
#     details: Lorem ipsum dolor sit amet, consectetur adipiscing elit
---

<script setup>
  import {
    VPTeamPage,
    VPTeamPageTitle,
    VPTeamMembers
  } from 'vitepress/theme'

  const members = [
    {
      avatar: 'https://avatars.githubusercontent.com/u/88631273?s=400&u=fcc9105b2375274f8f55f83c44a4b260e08de643&v=4',
      name: 'Coffeewithoutsugar',
      title: 'Backend Developer',
      links: [
        { icon: 'github', link: 'https://github.com/wonkiest29' },
        { icon: 'firefoxbrowser', link: 'https://coffeedev.dev/' },
      ]
    },
    {
      avatar: 'https://avatars.githubusercontent.com/u/142260596?v=4',
      name: 'Vakood',
      title: 'Frontend Developer',
      links: [
        { icon: 'github', link: 'https://github.com/Vakood' },
        { icon: 'firefoxbrowser', link: 'https://vakood.github.io/vakood.dev' }
    ]
    }
  ]

</script>

  <VPTeamMembers :members="members" />


  <!-- <VPTeamMembers :members="sellers" /> -->
